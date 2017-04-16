<div class='content'>
    <input accept-charset="UTF-8" type='text' id='author' name='author'/><br/>
    <textarea accept-charset="UTF-8" name='msg' id='msg'></textarea><br/>
    <button id='but'>Отправить!</button>
    <p id='name' name = '{{name}}'></p>


%include('allMessages.tpl', messages=messages, error=error)
</div>