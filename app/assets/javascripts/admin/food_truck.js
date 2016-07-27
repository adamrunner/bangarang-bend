function FoodTruck() {
  this.$inputSmall   = $("#ft-img-small");
  this.$previewSmall = $("#ft-prev-small");
  this.$fileSmall    = $("#ft-file-sm");
  this.$inputLarge   = $("#ft-img-large");
  this.$previewLarge = $("#ft-prev-large");
  this.$fileLarge    = $("#ft-file-lg");
  this.listeners();
}

FoodTruck.prototype = {
  constructor: FoodTruck,

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

  updatePreview: function(input, preview, file) {
    $(preview).removeClass('hidden');
    this.readURL(input, preview, file);
  },

  listeners: function() {
    var prevSmall = this.$previewSmall,
        fileSmall = this.$fileSmall,
        prevLarge = this.$previewLarge,
        fileLarge = this.$fileLarge;

    $(this.$inputSmall).change(function() {
      FoodTruck.prototype.updatePreview( this, prevSmall, fileSmall )
    });

    $(this.$inputLarge).change(function() {
      FoodTruck.prototype.updatePreview( this, prevLarge, fileLarge )
    });
  }

}
