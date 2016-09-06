$(document).on("ready",function(){
  $(document).on("click","#addproduct",function(){
    var mediaDropzone = new Dropzone("#image");
    Dropzone.options.mediaDropzone = {
    success: function (response) {
                eval(response.xhr.response);
            }
    };
    mediaDropzone.options.acceptedFiles = ".jpeg,.jpg,.png,.gif";
    mediaDropzone.options.maxFiles = 7;
    mediaDropzone.options.autoProcessQueue = false;
    mediaDropzone.options.parallelUploads = 1;
    mediaDropzone.on("maxfilesexceeded", function(file) {
        mediaDropzone.removeAllFiles();
        mediaDropzone.addFile(file);
    });
    mediaDropzone.on('success', mediaDropzone.processQueue());
    var submitButton = document.querySelector("#saveimage");
    submitButton.addEventListener("click", function() {
         mediaDropzone.processQueue();  // Tell Dropzone to process all queued files.
    });
    var newQueue = [];
    $(function() {
      $("#image").sortable({
        items: '.dz-preview',
        cursor: 'move',
        opacity: 0.5,
        containment: '#image',
        distance: 20,
        tolerance: 'pointer',
        stop: function () {
          var newQueue = [];
          var queue = mediaDropzone.files;
          $('#image .dz-preview .dz-filename [data-dz-name]').each(function (count, el) {
          var name = el.innerHTML;//el.getAttribute('data-name');
          queue.forEach(function(file) {
             if (file.name === name) {
                  newQueue.push(file);
              }
            });
          });
          console.log( newQueue[0].filename );
          mediaDropzone.files = newQueue;

          }
      });
    });

  });
});
