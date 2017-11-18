class Yearlyrate < ApplicationRecord
	self.table_name = "yearlyrates"
	belongs_to :school
end
