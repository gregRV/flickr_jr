$(document).ready(function() {

  // CREATES NEW ALBUM
  $('#new-album-form').on('submit', function(e){
  	e.preventDefault();

  	$.ajax({
  		url: '/albums',
  		type: 'post',
  		data: $(this).serialize()
  	}).done(function(response) {
  		// album.album BECAUSE SAVED 
  		// AS A HASH IN THE FORM! -__-
  		console.log(response.album.album.name);
  		$('li:last-child').append("<li><a href=/albums/" + 
  			response.album.album.id + ">" + 
  			response.album.album.name + "</a></li>");
  	});
  });

  // SHIT DONT WORK!!!!
  // // UPLOADS NEW IMAGE
  // $('#new-photo-form').on('submit', function(e){
  // 	e.preventDefault();

  // 	$.ajax({
  // 		url: '/uploads',
  // 		type: 'post',
  // 		data: $(this).serialize()
  // 	}).done(function(response) {
  // 		console.log(response.photo);
  // 	});
  // });
});