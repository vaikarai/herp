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

	$('#new_expense').submit(function(event) {
	  	event.preventDefault();

	  	$.ajax({
		  	url: $(this).attr('action'),
		  	type: 'POST',
		  	dataType: 'script',
		  	data: $(this).serialize(),
		  	beforeSend: function(){
		  		$("input[type='submit']")
			  	.val('Saving....')
			  	.attr('disabled','disabled')
				},
			complete: function(){
			  	$("input[type='submit']")
		  		.val('Create Expense')
			  	.removeAttr('disabled')
				}
		});

	});
});