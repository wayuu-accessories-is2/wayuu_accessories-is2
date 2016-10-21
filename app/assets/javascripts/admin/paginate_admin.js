
$(document).on("click",".pagination a", function(){
  alert("pagination");
    $.getScript(this.href);
    return false;
});
