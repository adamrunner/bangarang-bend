class PhilosophyItemsController < ApplicationController

  def index
    @philosophy_items = PhilosophyItem.all
  end
end
