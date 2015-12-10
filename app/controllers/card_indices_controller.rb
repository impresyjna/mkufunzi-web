class CardIndicesController < ApplicationController
  def show
  	@cardIndex = CardIndex.all
  end

  def new
  	@cardIndex = CardIndex.new
  end

  def create
  	@cardIndex = CardIndex.new(cardindex_params)
  	if @cardIndex.save
  		flash[:success] = "Pomyślnie dodano do kartoteki"
  		redirect_to @cardIndex
  	else
  		render 'new'
  	end
  end

  private

  	def cardindex_params
  		params.require(:card_index).permit(:name, :unit)
  	end
end
