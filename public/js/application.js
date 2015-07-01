$(document).ready(function() {
 $('input.new-word').autocomplete({
  source: wordList
 });

 $('div.new-word').on('submit', 'form', function(event) {
  event.preventDefault();
  var form = $(this);
  var word = form.find('input.new-word').val();

  var content = $('div.doc-content').find('p');
  content.append(" " + word);

  $('span').find('div').hide();
  var textBox = form.find('input[type="text"]')
  textBox.val('').select();
 });

 $('div.save').on('submit', 'form', function(event) {
  event.preventDefault();
  var form = $(this);

  var method = form.attr('method');
  var action = form.attr('action');
  var newContent = $('div.doc-content').find('p').text();

  var request = $.ajax({
    type: method,
    url: action,
    data: { content: newContent },
    dataType: 'json'
  });

  request.done(function(userId) {
    debugger
    window.location = "/users/" + userId + "/docs";
  })

 });
});
