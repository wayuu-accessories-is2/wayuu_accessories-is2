Dropzone.autoDiscover = false;



var headlineDropzone = new Dropzone("#dropzone", {

  url: "/admin/product/add", // You can override url of form in here.

  maxFilesize: 5, // in MB

  parallelUploads: 2,

  acceptedFiles:'.jpg, .png, .jpeg, .gif', // type of files

  init: function(){

    this.on('addedfile', function(file) {

      // Called when a file is added to the list.

    });

    this.on('sending', function(file, xhr, formData) {

      // Called just before each file is sent.

    });

    this.on('success', function(file, json) {

      // Called when file uploaded successfully.

    });

  }

});
