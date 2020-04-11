class CoinsController < ApplicationController
	skip_before_filter :verify_authenticity_token  

	def get_all_coins
		coins = get_user_coins params[:user_id]
		phone = get_user_info params[:user_id]
		render(json: { data: {coins:coins, phone:phone}})
	end

	def redeem_coins
		@coins = Coin.create!()
		@coins.user_id = params[:user_id]
		@coins.coin_count = params[:coin_count]

		if @coins.save
			user = User.find_by_id(params[:user_id])
			user.phone = params[:phone]
			user.save()

			redeem = Redeem.create!()
			redeem.amount = -(params[:coin_count].to_i/1000)*10
			redeem.user_id = params[:user_id]
			redeem.phone = params[:phone]

			if redeem.save 
				coins = get_user_coins params[:user_id]
				phone = get_user_info params[:user_id]
				render(json: { message: "You will get amount in your account with in 48 hours.",data: {coins:coins, phone:phone}}, status: :created)

			else
				render(json: { message: "Coins redeem error."}, status: :bad)
			end
				
		else
			render(json: @coins.errors, status: :bad)
		end
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
		records_array = ActiveRecord::Base.connection.execute("SELECT sum(coin_count) from coins where user_id = "+user_id.to_s)
		total_coins = 0

		records_array.each do |row|
			if row[0] != nil 
				total_coins += row[0].to_i
			end
		end
		total_coins

	end

	def get_user_info user_id
		records_array = ActiveRecord::Base.connection.execute("SELECT phone from users where id = "+user_id.to_s)
		phone = ""
		records_array.each do |row|
			if row[0] != nil 
				phone = row[0]
			end
		end
		phone
		
	end
	
	
	def coin_params
		params.permit(:user_id, :coin_count,:phone)
	end
end
