class Group < ActiveRecord::Base
 validates :user_name, presence: true
 validates :group, presence: true
 validates_uniqueness_of :user_name, :scope => :group
end
