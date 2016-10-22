$(document).ready(function(){
	$("#EditProductModal").on('show.bs.modal',function(e){
		$(this).find('#productId').val($(e.relatedTarget).data('product-id'));
		$(this).find('#productname').val($(e.relatedTarget).data('product-name'));
		$(this).find('#productinfo').val($(e.relatedTarget).data('product-info'));
		$(this).find('#productprice').val($(e.relatedTarget).data('product-price'));
	});
	
	$("#EditUserModal").on('show.bs.modal',function(e){
		$(this).find('#userId').val($(e.relatedTarget).data('user-id'));
		$(this).find('#username').val($(e.relatedTarget).data('user-name'));
	});
});