$(document).ready(function(){
	//alert("si carga0");
	var count = 0
	$(document).on("click","#addText",function(){
		document.getElementById('content').innerHTML += '<label class="col-sm-2 control-label" for="input-content" >Content</label> <div class="col-sm-10"><textarea name="all" name="blog_content" placeholder="Content" style="min-width: 100%; max-width: 100%" id="content"></textarea></div><br>';
		count++;
	});
	$(document).on("click","#addImage",function(){
		document.getElementById('content').innerHTML += '<div style:"display:block;"><label class="col-sm-2 control-label" for="input-image" >Image </label><input name="all" type="file" data-buttonName="btn-primary"></div><br>';
		count++;
	});
});
//$( function() {
	//$( '#sortable' ).sortable();
	//$( '#sortable' ).disableSelection();
//});
//function update_order() {window.location.href = '/admin/product/sortimages?'+$('#sortable').sortable('serialize');
