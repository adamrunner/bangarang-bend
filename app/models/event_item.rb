class EventItem < ActiveRecord::Base
  belongs_to :page
  has_and_belongs_to_many :event_produce_items
  before_save :strip_input

  def num_of_produce
    self.event_produce_items.length
  end

  private
  def strip_input
    self.name.strip
  end
end
