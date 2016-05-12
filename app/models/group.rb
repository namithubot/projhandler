class Group < ActiveRecord::Base
 validates :user_name, presence: true
 validates :groupname, presence: true
 validates_uniqueness_of :user_name, :scope => :groupname
end
