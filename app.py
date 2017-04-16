# -*- coding: utf-8 -*-
import bottle
import time
import os
import datetime
import sys
import json
from bottle_sqlite import Plugin

app = bottle.app()
sqlitePlugin = Plugin(dbfile='database.db')
app.install(sqlitePlugin)


@app.get('/')
@app.get('/<name>.html')
def main(db, name=''):
    if not name:
        name = 'mainPage'
    return main_template(db, name)


@app.route('/_add_numbers')
def send_message(db):
    author = bottle.request.params.decode(encoding='utf-8').get('author', '', type=str)
    msg = bottle.request.params.decode(encoding='utf-8').get('msg', '', type=str)
    name = bottle.request.params.decode(encoding='utf-8').get('name', '', type=str)
    msg = msg.replace('<', '&#60')
    msg = msg.replace('>', '&#62')
    author = author.replace('<', '&#60')
    author = author.replace('>', '&#62')
    if not all([author, msg]):
        return get_json(db, table(name))

    db.execute("insert into {} (author, message, time) values (?, ?, ?)".format(table(name)),
               (author.encode('utf-8'), msg.encode('utf-8'), int(time.time())))
    db.commit()
    return get_json(db, table(name))


def table(name):
    if name == 'mainPage':
        return "Messages"
    else:
        return 'messagesPh'


def get_json(db, _table):
    data = db.cursor()
    data.execute('select author, message from {} order by time desc'.format(_table))
    ans = ''
    for m in data:
        ans += '<h4 accept - charset = "UTF-8"> Автор: ' + m[0].decode('utf-8') + '</h4>\
            <div accept - charset = "UTF-8"> ' + m[1].decode('utf-8') + '</div>'
    return json.dumps({'result': ans})


def main_template(db, name, error=''):
    messages = db.execute('select author, message from {} order by time desc'.format(table(name))).fetchall()
    return template(db, name, messages, error)


def template(db, name, messages='', error=''):
    data = db.cursor()
    client_ip = bottle.request.environ.get('REMOTE_ADDR')
    data.execute("SELECT time FROM ips WHERE ip = ?", (client_ip,))
    if not data.fetchone():
        data.execute("INSERT INTO ips ('ip', 'time') VALUES ('{}', {})".format(client_ip, round(time.time())))
        greeting = 'Добро пожаловать, новый гость'
    else:
        data.execute("SELECT time from ips WHERE ip='{}'".format(client_ip))
        t = data.fetchone()[0]
        d_time = time.time() - t
        if d_time < 10:
            greeting = 'О, вы вернулись, мы вам рады, хотя вы были тут недавно... всего-то {} секунд назад'.format(
                round(d_time, 2))
        else:
            greeting = 'Давно вас небыло тут, добро пожаловать, если что в последний раз вы были тут в {} '.format(
                time.ctime(t))
        data.execute("UPDATE ips SET time=({}) WHERE ip = ('{}')".format(round(time.time()), client_ip))
    db.commit()
    data.execute("SELECT COUNT(*) from ips")
    count_all = data.fetchone()[0]
    today = round(time.mktime(datetime.datetime.now().timetuple()))
    data.execute("SELECT COUNT(*) from ips WHERE time>={}".format(today))
    count_today = data.fetchone()[0]
    return bottle.template(name, messages=messages, error=error, count_all=count_all, count_today=count_today,
                           greeting=greeting)


@app.get("/static/css/<filepath:re:.*\.css>")
def css(filepath):
    return bottle.static_file(filepath, root="static/css")


@app.get("/static/font/<filepath:re:.*\.(eot|otf|svg|ttf|woff|woff2?)>")
def font(filepath):
    return bottle.static_file(filepath, root="static/font")


@app.get("/static/images/<filepath:re:.*\.(jpg|png|gif|ico|svg|PNG)>")
def img(filepath):
    return bottle.static_file(filepath, root="static/images")


@app.get("/static/js/<filepath:re:.*\.js>")
def js(filepath):
    return bottle.static_file(filepath, root="static/js")


if '--debug' in sys.argv[1:] or 'SERVER_DEBUG' in os.environ:
   bottle.debug(True)


def wsgi_app():
    """Returns the application to make available through wfastcgi. This is used
    when the site is published to Microsoft Azure."""
    return bottle.default_app()


if __name__ == '__main__':
    app.run(server='wsgiref', host=HOST, port=PORT)
