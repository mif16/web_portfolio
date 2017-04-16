<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name=viewport content="width=device-width, initial-scale=1">
    <title>Портфолио</title>
    <link rel="icon" type="image/png" href="static/images/favicon.ico">
    <link rel="stylesheet" type="text/css" href="static/css/mainCSS.css">
    <link rel="stylesheet" type="text/css" href="static/css/backgroundCSS.css">
    <link rel="stylesheet" type="text/css" href="static/css/menuCSS.css">
    <link rel="stylesheet" media="(max-width: 640px)" href="static/css/mainMedia.css">
    <script src="static/js/menu.js" type="text/javascript" ></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="static/js/form.js"></script>
</head>
<body>
<div class="head">
</div>
<div class="container">
    <ul class="menu" style="display: block">
        <li id="1"><a href="mainPage.html">Главная</a></li>
        <li id="2"><a href="photo.html">Фотогалерея</a></li>
    </ul>
    <div class="content">
        <p><img src="static/images/me.PNG" alt="Я" class="me"> <b>Каменщик Константин</b>
        </p>
        <p><b>Обо мне:</b><br> Учусь на МатМехе УрГУ, в будущем скорее всего стану разработчиком.
            В данный момент изучаю Web(html+javascript+css) и никакого php:) C#, Python, F# и много чего еще.</p>
    </div>
    <div class="content">
        <b style="float: left">Мои навыки</b>
        <ul class="skills">
            <li style="list-style: none">В программировании</li>
            <li>C#+F#</li>
            <li>немного Java</li>
            <li>javascript+css+html</li>
        </ul>
        <ul class="skills">
            <li style="list-style: none">В остальном</li>
            <li>работал в Photoshop</li>
            <li>быстро обучаюсь</li>
            <li>понимаю почти все с первого раза</li>
        </ul>
    </div>
    <div class="content">
        <b>Мои Проекты</b><br> Пока никаких рабочих проектов нет, но было множество учебных на большой спектр знаний.
        <br>
        <br> <br>
    </div>
    <div class="content">
        <b style="float: left;">Образование</b>
        <ul class="education">
            <li>2003-2010гг., г.Екатеринбург, МАОУ гимназия № 37</li>
            <li>2010-2014гг., г.Екатеринбург, СУНЦ УрФУ, мат-инф</li>
            <li>2014-..., г.Екатеринбург, УрФУ, ИМКН,"Компьютерные науки"</li>
        </ul>
    </div>
    <div class="content">
        <b style="float: left">Контакты:</b>
        <ul class="cont">
            <li>
                Моя почта: <a href="mailto:kkm.kkm2015@yandex.ru">kkm.kkm2015@yandex.ru</a>
            </li>
            <li>
                <a href="https://vk.com/id62680630" target="_blank" style="text-decoration: none">Моя страница в VK</a>
            </li>
        </ul>
    </div>
    <div class="content">
        <b style="display: inline-block">Полезные ссылки</b>
        <ul style="padding-left: 15%">
            <li><a href="http://urfu.ru" target="_blank">УрФУ</a></li>
            <li><a href="http://imkn.urfu.ru" target="_blank">МАТ-МЕХ</a></li>
        </ul>
    </div>
    %include('forum.tpl',name='mainPage', messages=messages, error=error)
    <div class='content'>
          <div style='background-color:purple; display:inline-block'>
          Кол-во людей побывавших тут: Всего: {{count_all}}, Сегодня: {{count_today}}
          </div><br>
          {{greeting}}
    </div>
</div>
</body>
</html>