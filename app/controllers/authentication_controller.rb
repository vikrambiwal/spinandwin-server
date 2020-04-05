class AuthenticationController < ApplicationController
	skip_before_filter :verify_authenticity_token  

	def login
   		user = User.find_by_email(params[:email])

		if user && user.authenticate(params[:password])
			render(json: { data: user })
	  	else
			render(json: { error: "Invalid data." }, status: :unauthorized)
	  	end
	end
end
