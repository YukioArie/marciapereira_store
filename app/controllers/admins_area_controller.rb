class AdminsAreaController < ApplicationController
  before_action :authenticate_admin!
  layout 'admins_area'
end
