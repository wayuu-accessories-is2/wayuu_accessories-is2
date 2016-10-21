$(window).load(function() {
  var $window = $(window);
  console.log($window.width());
  if ($window.width() < 767) {
    console.log("Holaaaaa");
    console.log($window.width());
      $("#navbar-wishlist").prepend(document.createTextNode('Wishlist'));
  }
});
