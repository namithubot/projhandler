class MyGroup < ActiveRecord::Base
	#auto_strip_attributes :groupname
	def groupname=(groupname)
    write_attribute(:groupname, groupname.try(:strip))
  end
	validates :groupname, presence: true, uniqueness: true
	#before_validation :strip_whitespaces_group, :only => 
#[:groupname]
#def strip_whitespaces_group
#	self.groupname = self.groupname.strip unless self.groupname.nil?
#end
end
