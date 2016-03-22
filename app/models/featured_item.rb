class FeaturedItem < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :page
  before_save :format_link_url

  def full_link_url
    if self.link_url != nil && !self.link_url[/http/i]
      "https://bangarangbend.com/" << self.link_url
    else
      self.link_url
    end
  end

  private

  def format_link_url
    link = self.link_url
    if link && link[/bangarangbend.com/i]
      # Ugly strip method, grabs everything after bangarangbend.com/, removes any slashes from start and end as well as any 2 or more slashes in the middle of the url
      #TODO find a cleaner way to do this some time
      link = link[/bangarangbend.com\/(.+)/i, 1].gsub(/^\/{1,}/, '').gsub(/\/{2,}/, '/').gsub(/\/{1,}$/, '')
      self.link_url = link
    elsif link === ""
      self.link_url = nil
    end
  end
end
