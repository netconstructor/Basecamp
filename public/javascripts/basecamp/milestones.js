$(document).ready(function(){
	$("#datepicker").datepicker({
		dateFormat: 'dd-mm-yy',
		onSelect: function(dateText, inst)
		{ 
			$("#MilestoneDate").html(""+dateText);
			$("#milestone_deadline").val(""+dateText);
		}
	});
});

