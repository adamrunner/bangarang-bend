// TODO: clean this code up
var featuredItemsSort = function() {
  var el           = document.getElementById('featured-items');
  var $el          = $(el);
  var $handles     = $el.find('h4');
  var featuredHead = $('#featured-head');
  var sortOn       = featuredHead.children('.sort-on');
  var sortOff      = featuredHead.children('.sort-off');
  var childs       = $(el).children();
  var $cardRow     = $(childs).find('.card-row');

  window.order = {}
  window.order.items = childs

  window.sortable = Sortable.create(el, {
    disabled: true
  });

  $.Velocity.RegisterEffect('transitionHeight', {
    defaultDuration: 200,
    calls: [
        [ { height: '6.5rem' }, 1 ]
    ],
    reset: { height: '100%', minHeight: '6.5rem' }
  });

  // toggle sorting when button clicked
  $('#toggle-sort').click(function (event) {
    // get sorting state, disabled == true || false
    var state = sortable.option("disabled");

  if (state == true) {

      sortOff.velocity('transition.slideRightBigOut', {duration: 200, stagger: 100, backwards: true});
      sortOn.velocity('transition.slideLeftBigIn', {duration: 300, delay: 500, stagger: 25, display: "flex"});

      // enable sorting
      window.sortable.option("disabled", false);
      $handles.addClass('enabled');
      $(childs).velocity('transitionHeight', {duration: 300, delay: 250}, "easeInOutQuart");
      $cardRow.velocity('transition.slideDownOut', {duration: 300});
    }
  });

  $('#save-sort').click(function(event){
    // get sorting state, disabled == true || false
    var state = sortable.option("disabled");
    // var childs = $el.children();

    sortOn.velocity('transition.slideRightBigOut', {duration: 200, stagger: 100, backwards: true});
    sortOff.velocity('transition.slideLeftBigIn', {duration: 300, delay: 500, stagger: 25, display: "flex"});

    if (state == false) {
      var order = sortable.toArray();
      data = {}
      data.item_order = {}
      // covert new sort order into obj
      order.forEach(function(id, index) {
        data.item_order[id] = index
      });
      // send new sort order via post request
      submitUpdate = $.post('/admin/featured_items/update_order.json', data);

      submitUpdate.fail(function(jqXHR, textStatus, errorThrown) {
        var data = jqXHR.responseJSON;
        Bangarang.trigger( 'flashMessage', data );
      });

      submitUpdate.done(function(data, textStatus, jqXHR) {
        var data = data;
        Bangarang.trigger( 'flashMessage', data );
      });

      // turn sorting off
      window.sortable.option("disabled", true);
      $handles.removeClass('enabled');
      $(childs).velocity({height: '100%'});
      $cardRow.velocity('transition.fadeIn');
    }
  });

  $('#cancel-sort').click(function(event) {
    var state = sortable.option("disabled");
    var childs = $(window.order.items);

    sortOn.velocity('transition.slideRightBigOut', {duration: 200, stagger: 100, backwards: true});
    sortOff.velocity('transition.slideLeftBigIn', {duration: 300, delay: 500, stagger: 25, display: "flex"});

    if (state == false) {
      window.sortable.option("disabled", true);
      $handles.removeClass('enabled');
      $el.html(childs)
      $(childs).velocity({height: '100%'});
      $cardRow.velocity('transition.fadeIn');
      }
  });

}
