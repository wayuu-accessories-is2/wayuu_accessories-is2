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
    var submitButton = document.querySelector("#saveimage")
    submitButton.addEventListener("click", function() {
        mediaDropzone.processQueue();  // Tell Dropzone to process all queued files.
    });
    $(function() {
      $("#image").sortable({
        items: '.dz-preview',
        cursor: 'move',
        opacity: 0.5,
        containment: '#image',
        distance: 20,
        tolerance: 'pointer',
        stop: function () {
            var queue = mediaDropzone.files;
            $('#image .dz-preview .dz-filename [data-dz-name]').each(function (count, el) {
                var name = el.getAttribute('data-name');
                console.log(el.getAttribute('data-name'));
                queue.forEach(function(file) {
                   if (file.name === name) {
                        newQueue.push(file);
                   }
                });
            });
        mediaDropzone.files = newQueue;

          }
      });
    });

    // Dropzone.options.image = {
    //   // Prevents Dropzone from uploading dropped files immediately
    //
    //        init : function() {
    //            var submitButton = document.querySelector("#addproduct")
    //            myDropzone = this;
    //            submitButton.addEventListener("click", function() {
    //                myDropzone.processQueue();  // Tell Dropzone to process all queued files.
    //            });
    //           // to handle the added file event
    //            this.on("addedfile", function(file) {
    //                var removeButton = Dropzone.createElement("<button> Remove file </button>");
    //                 // Capture the Dropzone instance as closure.
    //                var _this = this;
    //
    //                // Listen to the click event
    //                removeButton.addEventListener("click", function(e) {
    //                // Make sure the button click doesn't submit the form:
    //                    e.preventDefault();
    //                    e.stopPropagation();
    //
    //                // Remove the file preview.
    //                _this.removeFile(file);
    //                // If you want to the delete the file on the server as well,
    //                // you can do the AJAX request here.
    //                });
    //                file.previewElement.appendChild(removeButton);
    //            });
    //            this.on("maxfilesexceeded", function(file) {
    //                this.removeAllFiles();
    //                this.addFile(file)
    //            });
    //        }
    //    };
  });
});
