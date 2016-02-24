class EventItem < ActiveRecord::Base
  belongs_to :page
  has_and_belongs_to_many :event_produce_items

  def num_of_produce
    self.event_produce_items.length
  end
end
