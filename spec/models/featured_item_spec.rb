require 'rails_helper'

RSpec.describe FeaturedItem, type: :model do

  it "changes https to http" do
    f = FeaturedItem.new
    f.link_url = "https://foo.com/services"
    f.save
    expect(f.reload.link_url).to eql "http://foo.com/services"
  end

  it "allows external uri" do
    f = FeaturedItem.new
    f.link_url = "www.google.com"
    f.save
    expect(f.reload.link_url).to eql "http://www.google.com"

    f = FeaturedItem.new
    f.link_url = "google.com"
    f.save
    expect(f.reload.link_url).to eql "http://google.com"
  end

  it "allows relative uri" do
    f = FeaturedItem.new
    f.link_url = "https://bangarangbend.com/services"
    f.save
    expect(f.reload.link_url).to eql "/services"

    f = FeaturedItem.new
    f.link_url = "bangarangbend.com/services"
    f.save
    expect(f.reload.link_url).to eql "/services"

    f = FeaturedItem.new
    f.link_url = "www.bangarangbend.com/services"
    f.save
    expect(f.reload.link_url).to eql "/services"

    f = FeaturedItem.new
    f.link_url = "/services"
    f.save
    expect(f.reload.link_url).to eql "/services"
  end

end
