$(document).ready(function(){
	var currentTime = new Date()
        var month = currentTime.getMonth() + 1
        if(month<10)
        {
           month = "0"+month;
        }
        var day = currentTime.getDate()
        if(day<10)
        {
           day = "0"+day;
        }
        var year = currentTime.getFullYear()
        $("#MilestoneDate").html( day + "/" + month + "/" + year);
        $("#milestone_deadline").val( day + "/" + month + "/" + year);

	$("#datepicker").datepicker({
		dateFormat: 'dd-mm-yy',
		onSelect: function(dateText, inst)
		{ 
			$("#MilestoneDate").html(""+dateText);
			$("#milestone_deadline").val(""+dateText);
		}
	});
});

