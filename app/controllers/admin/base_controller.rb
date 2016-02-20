class Admin::BaseController < ApplicationController
  include Breadcrumbs
  layout 'admin'
  before_action :authenticate_admin!
end
