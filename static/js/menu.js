(function () {
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
    }
})();