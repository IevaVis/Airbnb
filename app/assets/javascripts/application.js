// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-datepicker

$(document).on('turbolinks:load', function() {
	$('.datepicker').datepicker({
		format: 'yyyy-mm-dd',
		autoclose: true,
	});

	// when clicking on button class filter
	$('.filter').on('click', function(event){
		// prevent Default = default is getting all the listings
		event.preventDefault();
		//instead look for the listings from search bar where smoker = true
		$.ajax({
			url: '/search?search=' + $("#search").val() + "&smoker=true",
			method: "GET",
			dataType: "json",
			success: function(data){
				//when success empty the row
				$(".row").empty()
				for (var i = data.length - 1; i >= 0; i--) {
					$(".row").append('<div class="col-md-4"><div class="listings"><img src='
					+
					function() {
						if (data[i].avatars.length == 0) {
							return "/assets/House.jpg"
						} else {
							return data[i].avatars[0].url
						}
					}()
					+
					' , class="images"><a class="country-link" href="/listings/'
					+ data[i].id + 
					'">' + data[i].country + '</a><br><a class="title-link" href="/listings/'
					+ data[i].id + 
					'">' + data[i].title + '</a><br><div class="price-info"><span>€</span>'
					+ data[i].price_per_day +
					'<span>per night</span></div></div></div>')
				}
			}
		});
	})
})


$(document).on('turbolinks:load', function() {


	// when clicking on button class filter
	$('.filter').on('click', function(event){
		// prevent Default = default is getting all the listings
		event.preventDefault();
		//instead look for the listings from search bar where smoker = true
		$.ajax({
			url: '/search?search=' + $("#search").val() + "&pets_allowed=true",
			method: "GET",
			dataType: "json",
			success: function(data){
				//when success empty the row
				$(".row").empty()
				for (var i = data.length - 1; i >= 0; i--) {
					$(".row").append('<div class="col-md-4"><div class="listings"><img src='
					+
					function() {
						if (data[i].avatars.length == 0) {
							return "/assets/House.jpg"
						} else {
							return data[i].avatars[0].url
						}
					}()
					+
					' , class="images"><a class="country-link" href="/listings/'
					+ data[i].id + 
					'">' + data[i].country + '</a><br><a class="title-link" href="/listings/'
					+ data[i].id + 
					'">' + data[i].title + '</a><br><div class="price-info"><span>€</span>'
					+ data[i].price_per_day +
					'<span>per night</span></div></div></div>')
				}
			}
		});
	})
})









