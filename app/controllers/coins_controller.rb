class CoinsController < ApplicationController
	skip_before_filter :verify_authenticity_token  

	def get_coins

		records_array = ActiveRecord::Base.connection.execute("SELECT count(*) from coins")
		render(json: { data: records_array })

		# coins = Coin.find(:conditions => {:user_id => params[:id]})

		# if coins 
		# 	render(json: { data: records_array })
	  	# else
		# 	render(json: { error: "No data found." }, status: :unauthorized)
	  	# end
	end

	def add_coins
		@coins = Coin.create!(coin_params)

		if @coins.save
			render(json: { message: "Coins added successfully"}, status: :created)
		else
			render(json: @coins.errors, status: :bad)
		end
	end
	
	def coin_params
		params.permit(:user_id, :coin_count)
	end
end
