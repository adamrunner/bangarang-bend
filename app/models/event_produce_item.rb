class EventProduceItem < ActiveRecord::Base
  has_and_belongs_to_many :event_items
  belongs_to :page
end
