class CoinsController < ApplicationController
	skip_before_filter :verify_authenticity_token  

	def get_coins
		coins = get_user_coins params[:id]
		render(json: { data: coins })
	end

	def add_coins
		@coins = Coin.create!(coin_params)

		if @coins.save
			coins = get_user_coins params[:user_id]
			render(json: { message: "Coins added successfully",data: coins}, status: :created)
		else
			render(json: @coins.errors, status: :bad)
		end
	end


	def get_user_coins user_id
		records_array = ActiveRecord::Base.connection.execute("SELECT sum(coin_count) from coins where user_id = "+user_id)

		total_coins = 0
		records_array.each do |row|
			total_coins += row[0]
		end
		total_coins
	end
	
	def coin_params
		params.permit(:user_id, :coin_count)
	end
end
