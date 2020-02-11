class Fund < ActiveRecord::Base
    belongs_to :user
	belongs_to :pitch
end