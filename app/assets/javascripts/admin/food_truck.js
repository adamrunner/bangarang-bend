function FoodTruck() {
  this.initialize();
}

FoodTruck.prototype = {
  constructor: FoodTruck,

  initialize: function() {
    this.$inputSmall   = $("#ft-img-small")[0];
    this.$previewSmall = $("#ft-prev-small");
    this.$fileSmall    = $("#ft-file-sm");
    this.$inputLarge   = $("#ft-img-large")[0];
    this.$previewLarge = $("#ft-prev-large");
    this.$fileLarge    = $("#ft-file-lg");
    this.listeners();
  },

  readURL: function(input, preview, file) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $(preview).attr('src', e.target.result);
      }

      $(file).html( input.value.replace( /(^.+\\)/g, "") );
      reader.readAsDataURL(input.files[0]);
    }
  },

  updatePreview: function(type) {
    switch (arguments[0]) {
      case "small":
        this.$previewSmall.removeClass('hidden');
        this.readURL(this.$inputSmall, this.$previewSmall, this.$fileSmall);
        break;
      case "large":
        this.$previewLarge.removeClass('hidden');
        this.readURL(this.$inputLarge, this.$previewLarge, this.$fileLarge);
        break;
    }
  },

  listeners: function() {
    $(this.$inputSmall).change(this.updatePreview.bind( this, "small" ));
    $(this.$inputLarge).change(this.updatePreview.bind( this, "large" ));
  }

}
