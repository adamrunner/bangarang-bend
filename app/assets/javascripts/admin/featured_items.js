function FeaturedItemSorter(options) {
  this.initialize();
}

FeaturedItemSorter.prototype = {
  constructor: FeaturedItemSorter,


  initialize: function() {
    this.el       = document.getElementById('featured-items');
    this.sortable = Sortable.create( this.el, { disabled: true });
    this.$el      = $(this.el);
    this.$handles = this.$el.find('h4');
    this.$head    = $('#featured-head');
    this.$sortOn  = this.$head.children('.sort-on');
    this.$sortOff = this.$head.children('.sort-off');
    this.$childs  = this.$el.children();
    this.$cardRow = this.$childs.find('.card-row');
    this.setListeners();
    this.registerAnimation();
  },


  setListeners: function() {
    $('#toggle-sort').click(this.toggleSort.bind(this));
    $('#save-sort').click(this.saveSort.bind(this));
    $('#cancel-sort').click(this.cancelSort.bind(this));
  },



  registerAnimation: function() {
    $.Velocity.RegisterEffect('transitionHeight', {
      defaultDuration: 300,
      calls: [
          [ { height: '6.5rem' }, 1 ]
      ],
      reset: { height: '100%', minHeight: '6.5rem' }
    });
  },


  enableSorting: function() {
    this.animateSorts(this.$sortOff, this.$sortOn);
    this.sortable.option("disabled", false);
    this.$handles.addClass('enabled');
    this.$childs.velocity('transitionHeight', { delay: 250 }, "easeInOutQuart");
    this.$cardRow.velocity('transition.slideDownOut', { duration: 300 });
  },


  disableSorting: function() {
    this.animateSorts(this.$sortOn, this.$sortOff);
    this.sortable.option("disabled", true);
    this.$handles.removeClass('enabled');
    this.$childs.velocity({ height: '100%' });
    this.$cardRow.velocity('transition.fadeIn');
  },


  toggleSort: function() {
    var state = this.sortable.option("disabled");

    if (state == true) {
      this.enableSorting();
    }
  },


  saveSort: function() {
    var state = this.sortable.option("disabled");

    if (state === false) {
      var order = this.sortable.toArray();
      data = {}
      data.item_order = {}

      order.forEach(function (id, index) {
        data.item_order[id] = index
      });

      this.submitUpdate(data);
      this.disableSorting();
    }
  },


  submitUpdate: function (data) {
    update = $.post('/admin/featured_items/update_order.json', data);

    update.fail( function (jqXHR, textStatus, errorThrown) {
      var data = jqXHR.responseJSON;
      Bangarang.trigger( 'flashMessage', data );
    });

    update.done(function (data, textStatus, jqXHR) {
      var data = data;
      Bangarang.trigger( 'flashMessage', data );
    });
  },


  cancelSort: function() {
    var state = this.sortable.option("disabled");

    if (state === false) {
      this.$el.html(this.$childs);
      this.disableSorting();
    }
  },


  animateSorts: function(sortOut, sortIn) {
    $(sortOut).velocity('transition.slideRightBigOut', { duration: 200, stagger: 100, backwards: true });
    $(sortIn).velocity('transition.slideLeftBigIn', { duration: 300, delay: 500, stagger: 25, display: "flex" });
  },

}
