class Income < ApplicationRecord
	belongs_to :resident
	belongs_to :income_type
	belongs_to :payment_type

	after_create :add_to_account
	after_update :update_to_account

	protected

		def add_to_account
			account = Account.new
			account_last = Account.last
			account.deposit = self.amount
			account.balance = account_last.balance + account.deposit
			account.date = DateTime.now
			account.trans_for = self.income_type.name
			# binding.pry
			account.trans_type = "Income"
			account.save!
		end

		def update_to_account
			account = Account.where(trans_for: self.income_type.name, trans_type: "Income")
			deposit = account.deposit
			account_last = Account.last
			account.deposit = self.amount
			account.balance = account_last.balance + abs(account.deposit - deposit)
			account.date = DateTime.now
			account.trans_for = self.income_type.name
			account.trans_type = "Income"
			account.save!
		end

	private 
end
