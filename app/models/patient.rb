class Patient < ActiveRecord::Base
	has_one :organ_weight
	has_one :body_measurement
	belongs_to :description
end
