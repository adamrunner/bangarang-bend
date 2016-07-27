class FoodTruckAddress < ActiveRecord::Base
  store :options, accessors: [ :default, :active ]
  belongs_to :page
end
