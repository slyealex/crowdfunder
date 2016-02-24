// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('ready page:load', function() {

  $('#search-form').on('click', function() {
    var searchValue = $('#search').val();

    $.ajax({
      url: '/projects?search=' + $('searchValue'),
      type: 'GET',
      dataType: 'script'
    });
  });

});
