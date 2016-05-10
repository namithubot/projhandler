class Group < ActiveRecord::Base
 validates_uniqueness_of :user_name, :scope => :groupname
end
