$(document).ready(function (){

	$('select#expense_category_id').change(function(data) {
		var value = $('select#expense_category_id').val();

		$.ajax({
		  	url: '/categories/' + value,
		  	type: 'GET',
		  	dataType: 'script'
		})
	});

	$('select#expense_account_id').change(function(data) {
		var value = $('select#expense_account_id').val();
		var userId = $('#new_expense').attr('data-user-id');
		
		$.ajax({
		  	url: '/users/' + userId + '/accounts/' + value,
		  	type: 'GET',
		  	dataType: 'script'
		})
	});


});