(function(){
  'use strict';

  $(window).one('load', function() {
    let $Form = $('#form');
    let $Table = $('#table');
    let $Error = $('#error');

    $Form.on('submit', function() {
      let $HTML = '';
      $Table.find('tr:not(:first)').remove();
      $.get('/palindrome/input.json', $Form.serialize(), function($JSON) {
        if($JSON['solution'].length === 0) {
          $Table.hide();
          $Error.show();
        } else {
          let i = 0;
          $.each($JSON['solution'], function($NULL, $Value) {
            $HTML += '<tr>\
                        <td>' + i++ + '</td>\
                        <td>' + $Value[0] + '</td>\
                        <td' + ($Value[1] ? ' class = "text-success">Да' : ' class = "text-danger">Нет') + '</td>\
                      </tr>';
          });      
          $Table.show().append($HTML);
          $Error.hide();
        }
      });
    });
  });
})();
