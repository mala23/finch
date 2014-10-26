// $.getJSON('api/peeps', function(data){
// 	data.reverse()
// 	$.each(data, function(index, peep) {
// 		var source = $("#peepTemplate").html();
// 		var template = Handlebars.compile(source);
// 		$('#peeps').append(template(peep));
// 	});
// });

// $('#peep').on('click', function() {
// 	$.post('/api/peeps/compose', {content: $('#content').val()});
// });

$(document).ready(function () {
  // Load PEEPS data immediately
  $.ajax({
    url: '/api/peeps',
    method: 'GET'
  }).done(function (data) {
  	data.reverse()
    $.each(data, function (index, peep) {
		var source = $("#peepTemplate").html();
		var template = Handlebars.compile(source);
		$('#peeps').append(template(peep));    });
  });
});

	// Form to create a new Peep
	$('#peep').on('click', function () {
	  var data = {};

	  // Get the data from the form elements
	  data.content = $('#content').val();

	  $.ajax({
	    url: '/api/peeps/compose',
	    method: 'POST',
	    data: data
	  }).done(function (response) {
	    console.log(response);
	  });
});