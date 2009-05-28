function AddTodo(todoid)
{
	var id = "AddTodoLink_"+todoid;
	$("#"+id).hide();
	id = "AddTodoForm_"+todoid;
	$("#"+id).show();
}
function HideAddTodoForm(todoid)
{
	var id = "AddTodoLink_"+todoid;
	$("#"+id).show();
	id = "AddTodoForm_"+todoid;
	$("#"+id).hide();
}

function EditTodo(todoid)
{
	var id = "Todo_"+todoid;
	$("#"+id).hide();
	id = "EditTodoForm_"+todoid;
	$("#"+id).show();
}
function HideEditTodoForm(todoid)
{
	var id = "Todo_"+todoid;
	$("#"+id).show();
	id = "EditTodoForm_"+todoid;
	$("#"+id).hide();
}


$(document).ready(function(){
	$(".TodoLi").mouseover(function(){
		var id=$(this).attr("id").substring(7);
		$("#TodoLinksSet_"+id).show();
	});
	$(".TodoLi").mouseout(function(){
		var id=$(this).attr("id").substring(7);
		$("#TodoLinksSet_"+id).hide();
	});
	
	$(".Todolist").mouseover(function(){
		var id=$(this).attr("id").substring(9);
		$("#TodolistLinksSet_"+id).show();
	});
	$(".Todolist").mouseout(function(){
		var id=$(this).attr("id").substring(9);
		$("#TodolistLinksSet_"+id).hide();
	});
	$(".Todos").sortable({ 
	    handle : '.handle', 
	  });
});