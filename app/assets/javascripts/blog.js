// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

//= require blog/jquery.min.js
//= require blog/codemirror.min.js
//= require blog/xml.min.js

//= require blog/froala_editor.min.js
//= require blog/plugins/align.min.js
//= require blog/plugins/char_counter.min.js
//= require blog/plugins/code_beautifier.min.js
//= require blog/plugins/code_view.min.js
//= require blog/plugins/colors.min.js
//= require blog/plugins/draggable.min.js
//= require blog/plugins/emoticons.min.js
//= require blog/plugins/entities.min.js
//= require blog/plugins/file.min.js
//= require blog/plugins/font_size.min.js
//= require blog/plugins/font_family.min.js
//= require blog/plugins/fullscreen.min.js
//= require blog/plugins/image.min.js
//= require blog/plugins/image_manager.min.js
//= require blog/plugins/line_breaker.min.js
//= require blog/plugins/inline_style.min.js
//= require blog/plugins/link.min.js
//= require blog/plugins/lists.min.js
//= require blog/plugins/paragraph_format.min.js
//= require blog/plugins/paragraph_style.min.js
//= require blog/plugins/quick_insert.min.js
//= require blog/plugins/quote.min.js
//= require blog/plugins/table.min.js
//= require blog/plugins/save.min.js
//= require blog/plugins/url.min.js
//= require blog/plugins/video.min.js


$(function(){
  $('#edit').froalaEditor()
});
