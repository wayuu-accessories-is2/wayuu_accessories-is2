$(document).ready(function(){
	//alert("si carga0");
	$(document).on("click","#index",function(){
		alert("si carga1");
		$.ajax({
			url: '/checkout/first',
			type: 'GET',
			data: {//name: $("#first").val(), description: $("#description").val()
			},
			success: function( result ){}
		});
	});


	$(document).on("click","#first",function(){
		alert("si carga1");
		$.ajax({
			url: '/checkout/first_data',
			type: 'POST',
			data: {//name: $("#first").val(), description: $("#description").val()
			},
			success: function( result ){}
		});
	});

	$(document).on("click","#addcart",function(){
		alert("si carga1");
		$.ajax({
			url: '/addtocart',
			type: 'POST',
			data: {id: $("#addcart").val(), authenticity_token: $("#authenticity_token").val()
			},
			success: function( result ){}
		});
	});

	$(document).on("click","#refresh",function(){
		$.ajax({
			url: '/refreshcart',
			type: 'GET',
			data: { id: $("#addcart").val()
			},
			success: function( result ){}
		});
	});

	$(document).on("click","#delete",function(){
		$.ajax({
			url: '/refreshcart',
			type: 'POST',
			data: {
			},
			success: function( result ){}
		});
	});

	$(document).on("click","#navbar-cart",function(){
		$.ajax({
			url: '/refreshcart',
			type: 'GET',
			data: {
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
