class InstagramAuth < ActiveRecord::Base

  has_many :instagram_images, dependent: :destroy do
    def create_or_update_each_by_id(collection)
      collection.each do |obj|
        o = find_by_id(obj[:id])
        o ? o.update(obj) : create(obj)
      end
    end
  end

  def self.create_or_update(attributes)
    instagram_auth = InstagramAuth.last
    instagram_auth ? instagram_auth.update(attributes) : InstagramAuth.create(attributes)
  end

end
