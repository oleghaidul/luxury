class RatesController < ApplicationController
	def create
		@item = Item.find(params[:item_id])
		@rate = @item.rates.build
		@rate.item_id = params[:item_id]
		@rate.count = params[:count]
		@rate.save!
	end
end
