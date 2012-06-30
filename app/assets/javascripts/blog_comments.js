function trim(str){
  return str.replace(/(^\s*)/g,'').replace(/(\s*$)/g,'');
}

var ref_limit = 50;

function ref_comment(number){
  var comment = $('#cbody' + number);
  var text = "\r" + ">[引用自#" + number + " " + $('#cname' + number).attr('cname') + "](#c" + number + ")\r>\r";
  text += trim(comment.text()).substr(0,ref_limit).replace(/\n/g,"\r>");
  if(comment.text().length > ref_limit){
    text += "...";
  }
  text += "\r\r***";
  $('#comment_form_body').text($('#comment_form_body').text() + text + "\r\r");
  $('#comment_form_body').focus();
}
