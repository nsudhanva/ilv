class Expense < ApplicationRecord
	belongs_to :expense_type
	belongs_to :payment_type

	validate :check_opening_balance
	after_create :sub_from_account
	after_update :update_to_account

	protected

		def sub_from_account
			account = Account.new
			account_last = Account.last
			# binding.pry
			if account_last.balance.to_i >= self.amount
				# binding.pry
				account.withdraw = self.amount
				account.balance = account_last.balance - account.withdraw
				account.date = Date.today
				account.trans_for = self.expense_type.name
				account.trans_type = "Expense"
				account.save!
			end
		end

		def update_to_account
			account = Account.find_by_trans_for_and_trans_type(self.expense_type.name, "Expense")
			# binding.pry
			withdraw = account.withdraw
			account_last = Account.last

			if account_last.balance >= self.amount
				account.withdraw = self.amount
				account.balance = account_last.balance - (account.withdraw - withdraw).abs	
				account.date = Date.today
				account.trans_for = self.expense_type.name
				account.trans_type = "Expense"
				account.save!
			end
		end

		def check_opening_balance
			account_last = Account.last
			# binding.pry
			unless account_last.balance.to_i >= self.amount
				errors.add(:amount, ": You have insufficient balance")
			end
		end
end
