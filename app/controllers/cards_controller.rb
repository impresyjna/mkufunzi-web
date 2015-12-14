class CardsController < ApplicationController
	def index
	end

	def new
		if params[:id].nil?
			flash[:danger] = "Coś poszlo nie tak..."
			redirect_to 'cards'
		else
			@card = Card.new
			@cardIndexInfo = CardIndex.find(params[:id])
		end
	end

	def show
		@cardIndex = CardIndex.all
		if params[:id].nil?
			@card = nil
		else
			@cardNew = Card.new
			@cardIndexInfo = @cardIndex.find(params[:id])
			@card = Card.where("user_id = ? AND card_index_id = ?", session[:user_id], params[:id])
			@cardplot = Card.select("created_at, measurement").where("user_id = ? AND card_index_id = ?", session[:user_id], params[:id])
		end
	end

	def create
	  	@card = Card.new(card_params)
	  	@card.user_id = session[:user_id]

	  	if @card.save
	  		@card.id = @card.card_index_id
	  		flash[:success] = "Pomyślnie dodano do kartoteki"
	  		redirect_to @card
	  	else
	  		render 'new'
	  	end
	end

  	private

  	def card_params
  		params.require(:card).permit(:measurement,:card_index_id)
  	end

end
