Bangarang = {

  events: {},

  trigger: function(type, data) {
    this.events[type].callback(data != undefined ? data : {});
  },

  listenTo: function(type, callback) {
    if (!this.events.hasOwnProperty(type)) {
      this.events[type] = {};
      this.createEvent(type, callback);
    } else {
      return;
    }
  },

  unListen: function(type) {
    delete(Bangarang.events[type]);
  },

  createEvent: function(type, callback) {
    this.events[type] = {
      callback: callback
    }
  }
}

function FlashMessage() {
  this.$el = $('#flash-messages');
  this.template = JST["admin/templates/flash_message"];
  this.sequence = [
    { e: this.$el, p: 'transition.bounceRightIn', o: { duration: 500, delay: 300 } },
    { e: this.$el, p: 'transition.expandOut', o: { duration: 300, delay: 5000 } }
  ],
  this.setListeners();
}

FlashMessage.prototype = {
  constructor: FlashMessage,

  render: function(data) {
    this.$el.html( this.template(data) ).hide().velocity.RunSequence( this.sequence );
  },

  setListeners: function() {
    Bangarang.listenTo( 'flashMessage', function(data) {
      FlashMessage.prototype.render.call(Bangarang.flashMessage, data);
    });
  }
}
