class UserController < ApplicationController
	skip_before_filter :verify_authenticity_token  

	def register
		@user = User.create!(user_params)
		if @user.save
			render(json: { message: "User created successfully",data: @user}, status: :created)
		else
			render(json: @user.errors, status: :bad)
		end
	end

	private

	def user_params
		params.permit(:email, :password)
	end
end
