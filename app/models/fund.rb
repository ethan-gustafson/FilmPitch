class Fund < ActiveRecord::Base
    belongs_to :pitch_funder, class_name: "User"
	belongs_to :funded_pitch, class_name: "Pitch"
end