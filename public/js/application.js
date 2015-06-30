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
 });

 $('div.save').on('submit', 'form', function(event) {
  event.preventDefault();

  var newContent = $('div.doc-content').find('p').text();

 });
});
