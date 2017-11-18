class Multiyearrate < ApplicationRecord
	self.table_name = "multiyearrates"
	belongs_to :school
end
