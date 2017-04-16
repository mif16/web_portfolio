<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name=viewport content="width=device-width, initial-scale=1">
    <title>Фотогалерея</title>
    <link rel="icon" type="image/png" href="static/images/favicon.ico">
    <link rel="stylesheet" type="text/css" href="static/css/photoCSS.css">
    <link rel="stylesheet" type="text/css" href="static/css/backgroundCSS.css">
    <link rel="stylesheet" type="text/css" href="static/css/menuCSS.css">
    <link rel="stylesheet" media="(max-width: 640px)" href="static/css/mainMedia.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="static/js/photo.js" type="text/javascript" ></script>
    <script src="static/js/form.js" type="text/javascript" ></script>

</head>
<body>
<div class="head"></div>
<div class="container">
    <ul class="menu">
        <li id = '1'><a href="mainPage.html">Главная</a></li>
        <li id = '2'><a href="photo.html">Фотогалерея</a></li>
    </ul>
    <div class="content">

        Фотогалерея
        <div class="photos">
            <div id="large" class="view">
                <img id="loading" src="static/images/cats/loading.gif" class="view">
                <img id="largeImg" src="static/images/cats/1.jpg" alt="Large image" class="view">
            </div>

            <ul id="thumbs">
                <li>
                    <a href="static/images/cats/0.jpg" title="Image 0"><img src="static/images/cats/0_tumb.jpg"></a>
                </li>
                <li>
                    <a href="static/images/cats/1.jpg" title="Image 1"><img src="static/images/cats/1_tumb.jpg"></a>
                </li>
                <li>
                    <a href="static/images/cats/2.jpg" title="Image 2"><img src="static/images/cats/2_tumb.jpg"></a>
                </li>
                <li>
                    <a href="static/images/cats/3.jpg" title="Image 3"><img src="static/images/cats/3_tumb.jpg"></a>
                </li>
                <li>
                    <a href="static/images/cats/4.jpg" title="Image 4"><img src="static/images/cats/4_tumb.jpg"></a>
                </li>
                <li>
                    <a href="static/images/cats/5.jpg" title="Image 5"><img src="static/images/cats/5_tumb.jpg"></a>
                </li>
                <li>
                    <a href="static/images/cats/6.jpg" title="Image 6"><img src="static/images/cats/6_tumb.jpg"></a>
                </li>
            </ul>
        </div>
        <div  class="view">
            <div id="helper" class="view" >
                <h1>Справка</h1>
                Нажатие на фото увеличивает его.<br>
                При просмотре:<br>
                ESC - закрывает фото,<br>
                Влево - переход к предыдушей фотографии,<br>
                Вправо- переход к следующей
            </div>
        </div>
    </div>
    %include('forum.tpl',name='photo', messages=messages, error=error)
    <div class="content">
          <div style='background-color:purple; display:inline-block'>
          Кол-во людей побывавших тут: Всего: {{count_all}}, Сегодня: {{count_today}}
          </div><br>
          {{greeting}}
    </div>
</div>
</body>
</html>