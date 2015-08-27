var editor = new Quill('#editor');

editor.on('text-change', function(delta, source) {
  $('#hidden-post').val(editor.getText());
});