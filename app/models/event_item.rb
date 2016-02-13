class EventItem < ActiveRecord::Base
  belongs_to :page
  has_and_belongs_to_many :event_produce_items
end
