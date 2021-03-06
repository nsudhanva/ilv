class Income < ApplicationRecord
	belongs_to :resident
	belongs_to :income_type
	belongs_to :payment_type

	validates :amount, presence: true
	validates :resident_id, presence: true
	validates :date_time, presence: true
	validates :payment_type_id, presence: true
	validates :income_type_id, presence: true
	validates :month, presence: true

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
			account = Account.where(trans_for: self.income_type.name, trans_type: "Income").last
			# binding.pry
			deposit = account.deposit
			account_last = Account.last
			account.deposit = self.amount
			account.balance = account_last.balance + (account.deposit - deposit).abs
			account.date = DateTime.now
			account.trans_for = self.income_type.name
			account.trans_type = "Income"
			account.save!
		end

	private 
end
