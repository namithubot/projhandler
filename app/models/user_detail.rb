#require "auto_strip_attributes"

class UserDetail < ActiveRecord::Base
	has_secure_password
	#auto_strip_attributes :username, :email
	validates :username, presence: true, uniqueness: true
	validates :password_digest, presence: true, length: {minimum: 8}, confirmation: true
	validates :email, format: {with: /\S+@\S+\.\S+/ }, uniqueness: true
	before_validation :strip_whitespace

def strip_whitespace
	self.username = self.username.strip unless self.username.nil?
	self.email = self.email.strip unless self.email.nil?
end
end
