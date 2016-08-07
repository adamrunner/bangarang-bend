class Landing < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :page
  before_save :format_heading

  private

  def format_heading
    self.heading = self.heading.downcase
  end
end
