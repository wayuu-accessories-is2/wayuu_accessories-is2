$(document).on("click","#container-categories .pagination a", function(){
    $.getScript(this.href);
    return false;
});
