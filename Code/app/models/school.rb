class School < ApplicationRecord
	self.table_name = "school"
	has_many :yearlyrates, :foreign_key => "school_id"
	has_many :multiyearrates, :foreign_key => "school_id"
end
