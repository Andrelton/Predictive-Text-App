$(document).ready(function() {

  // GENERATE AUTOCOMPLETE WORD BUTTONS UPON TYPING IN TEXT BOX
  // .autocomplete() is from the jQuery UI library
  $('input.new-word').autocomplete({
    // source for autocompleting (from wordList.js file)
    source: function(request, response) {
      // this reduces the number of autocomplete options
      var results = $.ui.autocomplete.filter(wordList, request.term);
      response(results.slice(0, 6));
    },
    // this removes the standard helper messages from the autocomplete method
    messages: {
        noResults: '',
        results: function() {}
    }
  });

  // ADD WORD TO DOC
 $('div.new-word').on('submit', 'form', function(event) {
  event.preventDefault();

  var form = $(this);
  var word = form.find('input.new-word').val();

  var content = $('div.doc-content').find('p');
  // adds word plus space to doc
  content.append(" " + word);

  var textBox = form.find('input[type="text"]');
  // clears input box, sends cursor to input box
  textBox.val('').select();
 });

 // SAVE UPDATED DOC
 $('div.save').on('submit', 'form', function(event) {
  event.preventDefault();
  var form = $(this);

  var method = form.attr('method');
  var action = form.attr('action');
  // pulls new content out of <p> tag
  var newTitle = $('h1#doc-title').text();
  var newContent = $('div.doc-content').find('p').text();

  // ajax call to update database
  var request = $.ajax({
    type: method,
    url: action,
    data: {
      title: newTitle,
      content: newContent
    },
    dataType: 'json'
  });
  // sloppy way to redirect
  request.done(function(userId) {
    window.location = "/users/" + userId;
  })

 });

// TEXT-TO-VOICE FOR WHOLE DOC
 $('div#document-controls').on('click', 'button.voice', function(event) {
  event.preventDefault();

  var text = $('div.doc-content').find('p').text();

  responsiveVoice.speak(text);
 });

 // TEXT-TO-VOICE FOR WORD
 // $('body').on('click', 'li.ui-menu-item', function(event) {
 //  var word = $(this).text();

 //  var deleteButton = $('<button>');
 //  deleteButton.addClass('delete').text('X');

 //  var voiceButton = $('<button>');
 //  // something like this can give us a 'music' icon...
 //  // voiceButton.addClass('voice').text('&#x266B; Hear Word!');
 //  voiceButton.addClass('voice word').text('\u260A Hear Word!');
 //  voiceButton.attr('name', word);
 //  $('body').append(deleteButton, voiceButton);
 // });

 $('div.new-word').on('click', 'button.voice.word', function(event) {
  event.preventDefault();

  // this was when we read from the buttonh
  // var text = $(this).attr('name');
  var text = $(this).siblings('input.new-word').val();
  responsiveVoice.speak(text);
 });

 $('div.new-word').on('click', 'button.delete', function(event) {
  event.preventDefault();

  var input = $(this).siblings('input.new-word');
  input.val('').select();
  });

 // ADD PHOTO
 // SHOW FORM
 $('div.photo').on('click', 'button.add-photo', function(event) {
  event.preventDefault();
  var button = $(this);

  button.toggle();
  button.siblings('form').removeClass('hidden');

 });

 // HIDE FORM
  $('div.photo').on('click', 'button.canceler', function(event) {
    event.preventDefault();
    var form = $(this).parent();

    form.siblings('button.add-photo').toggle();
    form.addClass('hidden');

  });

  // ....ACTUALLY ADD PHOTO
  $('div.photo').on('submit', 'form', function(event) {
    event.preventDefault();
    var form = $(this);

    var method = form.attr('method');
    var action = form.attr('action');

    var request = $.ajax({
      type: method,
      url: action,
      data: form.serialize(),
      dataType: 'html'
    });

    request.done(function(photoHTML) {
      form.parent().find('img').remove();
      form.parent().append(photoHTML);
      // $('div#doc-edit-area').prepend(photoHTML);
      form.find('input.url').val('');
      form.addClass('hidden');
      form.siblings('button.add-photo').text('Change Photo').toggle();
    });

    request.fail(function(errorMessage) {
      alert("Ok [thumbs up]");
    });

  });
});




