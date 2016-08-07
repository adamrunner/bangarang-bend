class FoodTruckAddress < ActiveRecord::Base
  store :options, accessors: [ :default ]
  belongs_to :page
  before_save :can_active_update?
  after_save :handle_active_save
  after_destroy :handle_active_destroy

  private
  def handle_active_save
    if self.active == true
      self.class.where('id != ? and active', self.id).update_all("active = false")
    end
  end

  def handle_active_destroy
    if self.active == true
      address = FoodTruckAddress.first
      address.active = true
      address.save
    end
  end

  def can_active_update?
    if FoodTruckAddress.all.length == 1
      self.active = true
    end
  end

end
