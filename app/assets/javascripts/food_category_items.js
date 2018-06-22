$( document ).on('turbolinks:load', function() {

  $('.cuisine_type_tabs li').on('click', function() {
    var cuisine_type = $(this).attr('id');
        url = '/food_categories/food_category_id/items'.replace('food_category_id', cuisine_type);

    switchFoodCategory(cuisine_type, url)
  })

  function switchFoodCategory(cuisine_type, url) {
    $.ajax({
      url: url,
      type: 'GET',
      success: function(response) {
        $('#food_items_container').html(response.html);
      },
      error: function(response) {
      }
    })
  }
})