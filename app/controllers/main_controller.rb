class MainController < ApplicationController
  
  def index
    @bg_images = Image.all.where(imageable_type: "background")
  end
end
