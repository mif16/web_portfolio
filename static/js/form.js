$(function() {
    var submit_form = function(e) {
            $.getJSON( '/_add_numbers', {
                author: $('input[name="author"]').val(),
                msg: $('textarea[name="msg"]').val(),
                name:  $('p#name').attr('name')
            }, function(data) {
                var html = $.parseHTML( data.result );
                $('#messages').html(html);
            });
            return false;
    };
    $('button#but').bind('click', submit_form);
    getData();
    setTimeout(getData,3000);
});

function getData(){
    $.getJSON( '/_add_numbers', {
        author: '',
        msg: '',
        name:  $('p#name').attr('name')
      }, function(data) {
        var html = $.parseHTML( data.result );
        $('#messages').html(html);
      });
}