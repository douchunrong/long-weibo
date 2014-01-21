$(function(){
  $("#create").click(function(){
     var content = $("#content").val();
     $.post("/create",{content:content},function(returnData){
       $("#image").html("<img src='"+returnData+"'>");
     });
  });
});
