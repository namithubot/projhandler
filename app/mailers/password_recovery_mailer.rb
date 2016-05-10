class PasswordRecoveryMailer < ApplicationMailer
default from: 'info@projhandler.com'
	def recover_my_password(user)
		@user = user
		mail(to: @user.email, subject: 'Password Recovery')
	end
end
