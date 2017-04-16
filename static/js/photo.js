(function () {
    var images = [];
    window.onload = function onLoad() {
        var menu1 = document.getElementById('1');
        var oldborder = menu1.style.border;
        menu1.onmouseover = function () {
            menu1.style.border = "1px solid #ff0";
        };
        menu1.onmouseout = function () {
            menu1.style.border = oldborder;
        };
        var menu2 = document.getElementById('2');
        menu2.onmouseover = function () {
            menu2.style.border = "1px solid #ff0";
        };
        menu2.onmouseout = function () {
            menu2.style.border = oldborder;
        };
        var thumbs = document.getElementById('thumbs');
        thumbs.onclick = function (e) {
            e = e || window.event;
            var target = e.target || e.srcElement;

            while (target != this) {

                if (target.nodeName == 'A') {
                    showThumbnail(largeImg, target.href, target.title);
                    return false;
                }
                target = target.parentNode;
            }

        };
        var larges = document.getElementById('large');
        larges.onclick = function (e) {
            e = e || window.event;
            var target = e.target || e.srcElement;
            if (target.nodeName == 'DIV') {
                invisible();
                return false;
            }


        };
        images = thumbs.getElementsByTagName('img');
        if (window.location.hash != '#none' && window.location.hash != '')
            fromHash();
        var loading = document.getElementById('loading');
        var url = loading.parentNode.href;
        var img = document.createElement('img');
        img.src = url;
    };

    function showThumbnail(el, href, title) {
        var photos = document.getElementsByTagName('img');
        var loading = document.getElementById('loading');
        var len = photos.length - 2;
        var num = Number(href.substring(href.lastIndexOf('/')).replace(/\D+/g, ""));
        for (var i = -1; i < 2; i += 2) {
            var url = images[(len+num + i) % len].parentNode.href;
            var img = document.createElement('img');
            img.src = url;
        }
        el.src = loading.src;
        el.alt = loading.alt;
        visible(el);
        el.src = href;
        el.alt = title;
        setHash(el);

    }

    function visible(el) {

        if (el.className.indexOf(' visible') < 1) {
            el.className += ' visible';
            el.parentNode.className += ' visible';
        }
    }

    function invisible() {
        try {
            var elems = document.querySelectorAll('.visible');
            var el = elems[elems.length - 1];
            if (el.className.indexOf(' visible') > 1) {
                el.className = el.className.replace(/\b visible\b/, '');
                el.parentNode.className = el.parentNode.className.replace(/\b visible\b/, '');
                window.location.hash = "none";
            }
        }
        catch (a) {
        }
    }

    function move(leng, direction) {
        var largeImg = document.getElementById('largeImg');
        var src = largeImg.src;
        var srclast = src.substring(src.lastIndexOf('/'));
        var src = src.substring(0,src.lastIndexOf('/'));
        var num = Number(srclast.replace(/\D+/g, ""));
        src = src + srclast.replace(num.toString(), ((num + direction) % leng).toString());
        var title = largeImg.alt;
        title = title.replace(num.toString(), ((num + direction) % leng).toString());
        showThumbnail(largeImg, src, title);
    }

    function setHash(el) {
        window.location.hash = el.src;
    }

    function fromHash() {
        var largeImg = document.getElementById('largeImg');
        var src = window.location.hash.substring(1);
        var title = 'Image ' + Number(src.replace(/\D+/g, ""));
        showThumbnail(largeImg, src, title)
    }

    window.onhashchange = function () {
        if (window.location.hash != '#none') {
            fromHash();
        }
    };
    document.onkeydown = function (e) {
        e = e || window.event;
        var keyCode = e.keyCode;
        var photos = document.getElementsByTagName('img');
        var largeImg = document.getElementById('largeImg');
        var len = photos.length - 2;
        switch (keyCode) {
            case 112: //F1
                if (!("onhelp" in window)) {
                    e.preventDefault();
                    var help = document.getElementById('helper');
                    visible(help)
                }
                else {
                    window.onhelp = function () {
                        var help = document.getElementById('helper');
                        visible(help);
                        return false;
                    }
                }
                break;
            case 27: //Esc
                invisible();
                break;
            case 39: //Right arrow

                if (largeImg.className.indexOf(' visible') > 1)
                    move(len, 1);
                break;
            case 37:
                if (largeImg.className.indexOf(' visible') > 1)
                    move(len, len - 1);
                break;
            case 38:
            case 40:
                if (largeImg.className.indexOf(' visible') > 1)
                    e.preventDefault();
        }
    };
})();