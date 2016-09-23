alert("si carga-1");
$(document).ready(function(){
	//alert("si carga0");

	$(document).on("click","#first",function(){
		alert("si carga1");
		$.ajax({
			url: '/checkout/first',
			type: 'POST',
			data: {//name: $("#first").val(), description: $("#description").val()
			},
			success: function( result ){}
		});
	});

});
//$( function() {
	//$( '#sortable' ).sortable();
	//$( '#sortable' ).disableSelection();
//});
//function update_order() {window.location.href = '/admin/product/sortimages?'+$('#sortable').sortable('serialize');
