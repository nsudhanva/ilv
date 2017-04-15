class ResidentType < ApplicationRecord
	has_many :residents

	validates :name, presence: true
end
