$(document).on("ready",function(){
  $(document).on("click",function(){
    var mediaDropzone = new Dropzone("#image");
    Dropzone.options.mediaDropzone = {
    success: function (response) {
                eval(response.xhr.response);
            }
    };
    mediaDropzone.options.acceptedFiles = ".jpeg,.jpg,.png,.gif";
    mediaDropzone.options.maxFiles = 7;
    mediaDropzone.on("maxfilesexceeded", function(file) {
          mediaDropzone.removeAllFiles();
          mediaDropzone.addFile(file);
    });
  });
});
