$(document).on("click","#container-categories .pagination a ,#product-containter .pagination a", function(){
    $.getScript(this.href);
    return false;
});
