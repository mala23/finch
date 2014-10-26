$.getJSON('api/peeps', function(data){
	data.reverse()
	$.each(data, function(index, peep) {
		var source = $("#peepTemplate").html();
		var template = Handlebars.compile(source);
		$('#peeps').append(template(peep));
	});
});

$('#peep').on('click', function() {
	$.post('/api/peeps/compose', {content: $('#content').val()});
});