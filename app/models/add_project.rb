class AddProject < ActiveRecord::Base
	validates :title, presence: true, length: {minimum: 5, maximum: 
36}
	validate :group_exists?

def group_exists?
	false if (!group_name.nil? && !MyGroup.where(groupname: 
group_name).exists?)
	#errors.add(:group_name, 'Group doesn't exists. Try adding it 
#first!')
end
end
