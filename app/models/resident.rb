class Resident < ApplicationRecord
	has_many :incomes
	belongs_to :resident_type

	validates :flat_no, presence: true
	validates :name, presence: true
	validates :family, presence: true
	validates :email, presence: true
	validates :phone, presence: true
	validates :resident_type_id, presence: true

end
