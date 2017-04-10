class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def index
  	@total_flats = Resident.all.count

  	@owners = Resident.where("resident_type_id = ?", 1).count
  	@tenants = Resident.where("resident_type_id = ?", 2).count
  	@total_residents = Resident.sum(:family)

  	@balance = Account.last.balance

  	@total_expenses = Expense.where(date_time: Time.now.beginning_of_month..Time.now.end_of_month).sum(:amount)
  	@total_incomes = Income.where(date_time: Time.now.beginning_of_month..Time.now.end_of_month).sum(:amount)
  
  	@residents = Resident.all 
  	@incomes = Income.all

  	@paid_residents = []
  	
  	@incomes.each do |income|
  	  @paid_residents.push(income)
  	end
  end
end
