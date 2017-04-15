// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require Chart.bundle
//= require chartkick
//= require_tree .

$(document).ready(function(){
  $('table').DataTable({
  	// responsive: true,
  	dom: 'Bfrtip',
    buttons: [
        'copy', 'csv', 'excel', 'pdf', 'print'
    ]
  });

  $('select').select2();
 	$("span.select2").css("width", "+=15");	

 	$("input[type=text]").addClass("form-control");
	$("input[type=password]").addClass("form-control");
	$("input[type=email]").addClass("form-control");
	$("input[type=number]").addClass("form-control");
	$("input[type=submit]").addClass("btn btn-primary");
 	$("textarea").addClass("form-control");
 	$("div.field").addClass("form-group");
 	$("form:not(.new_user)").wrap("<div class='form-box col-md-8 col-md-offset-3'></div>");
 	$("form.new_user").wrap("<div class='form-box-login col-md-8 col-md-offset-3'></div>");

 	$("a:contains('Back')").empty().append("<button class=\"btn btn-primary top-left-corner\" style=\"position: fixed\">Back</button>");
	$("a:contains('Back')").css("color", "white");
	$("button:contains('Back')").prepend("<span class=\"glyphicon glyphicon-menu-left\"></span>");
	$("a:contains('Show')").empty().append("<button class=\"btn btn-info\">Show</button>").css("color", "white");
	$("a:contains('Edit'):not(.edit-account)").empty().append("<button class=\"btn btn-warning\">Edit</button>").css("color", "white");
	$("a:contains('Destroy')").empty().append("<button class=\"btn btn-danger\">Destroy</button>").css("color", "white");
	$("a:contains('Sign up')").empty().append("<button class=\"btn btn-primary\">Sign Up</button>").css("color", "white");
	$("a:contains('Log in')").empty().append("<button class=\"btn btn-primary\">Log In</button>").css("color", "white");
	
	var href = $("a[href*='new']:not(.new-bar)").text();
	$("a[href*='new']:not(.new-bar)").empty();
	$("a[href*='new']:not(.new-bar)").append("<button class=\"btn btn-success\">" + href + "</button>").css("color", "white");

	window.setTimeout(function() {
      $(".alert").fadeTo(500, 0).slideUp(500, function(){
          $(this).remove(); 
      });
  }, 3000);
	
});