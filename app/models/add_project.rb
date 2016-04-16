class AddProject < ActiveRecord::Base
	validates :title, presence: true, length: {minimum: 5, maximum: 36}

end
