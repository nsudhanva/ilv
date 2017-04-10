class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def index
  	@total_flats = Resident.all.count

  	@owners = Resident.where("resident_type_id = ?", 1).count
  	@tenants = Resident.where("resident_type_id = ?", 2).count
  	@total_residents = Resident.sum(:family)
  end
end
