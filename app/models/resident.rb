class Resident < ApplicationRecord
	has_many :incomes
	belongs_to :resident_type
end
