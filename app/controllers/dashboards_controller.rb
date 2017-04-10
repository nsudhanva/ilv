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
  	@paid = []
    @corpus_fund_paid = []
    @corpus_paid = []

  	@incomes.each do |income|
  	  @paid_residents.push(income)
      @paid.push(income.resident.id)

      if income.income_type.name == "Corpus Fund"
        @corpus_fund_paid.push(income)
        @corpus_paid.push(income.resident.id)
      end
  	end

    @unpaid_residents = Resident.where.not(id: @paid)
    @corpus_fund_unpaid = Resident.where.not(id: @corpus_paid)
    # binding.pry
  end
end
