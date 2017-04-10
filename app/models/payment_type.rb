class PaymentType < ApplicationRecord
	has_many :expenses
	has_many :incomes
end
