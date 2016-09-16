class DeleteEvents < ActiveRecord::Migration
  def up
    produce = ProduceEventItem.all
    events = EventItem.all
  end
end
