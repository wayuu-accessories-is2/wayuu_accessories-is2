$(document).ready(function(){
		alert("A ver");
		$(document).on("click","#enviar",function(){
			$.ajax({
				url: '/category/change',
				type: 'POST',
				data: {name: $("#name").val(), description: $("#description").val(), id: $("#id").val() },
				success: function( result ){}
			});
		});
	});
