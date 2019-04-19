/*$(document).ready(function(){
 // disable right click and show custom context menu
 $("#mytable tr").bind('contextmenu', function (e) {
  var id = this.id;
  $("#txt_id").val(id);
 
  var top = e.pageY+5;
  var left = e.pageX;

  // Show contextmenu
  $(".context-menu").toggle(100).css({
   top: top + "px",
   left: left + "px"
  });

  // disable default context menu
  return false;
 });

 // Hide context menu
 $(document).bind('contextmenu click',function(){
  $(".context-menu").hide();
  $("#txt_id").val("");
 });

 // disable context-menu from custom menu
 $('.context-menu').bind('contextmenu',function(){
  return false;
 });
 
 // Clicked context-menu item
 $('.context-menu li').click(function(){
  var className = $(this).find("span:nth-child(1)").attr("class");
  var titleid = $('#txt_id').val();
  $( "#"+ titleid ).css( "background-color", className );
  var numorder = $(".data").find("td").text();
  alert(numorder);
  location.href = 'http://localhost:8080/springmvc/save-custom-student/+';
  
  $(".context-menu").hide();
 });

});
*/

$(function() {
    $(".context-menu-one").contextMenu({
        selector: 'tr',
        callback: function(key, options) {     
        	var numOrder = $(this).find("td:first-child").find("span").text();
        	
            /*alert("You clicked on: " + numOrder);*/
            location.href="http://localhost:8080/springmvc/save-custom-student/"+numOrder;
        },
        items: {
            "Chèn hàng": {name: "Chèn hàng", icon: "edit"},
            
        }
    });
});



