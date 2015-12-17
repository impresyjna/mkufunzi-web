class MeasurementsController < ApplicationController
	def index
	end

	def new
		if params[:id].nil?
			flash[:danger] = "Coś poszlo nie tak..."
			redirect_to 'cards'
		else
			@measurement = Measurement.new
			@measureTypeInfo = MeasureType.find(params[:id])
		end
	end

	def show
		@measureType = MeasureType.all
		if params[:id].nil?
			@card = nil
		else
			@measurementNew = Measurement.new
			@measureTypeInfo = @measureType.find(params[:id])
			@ProtegeCard = Card.find_by(protege_id: session[:protege_id])
			@card = Measurement.where("card_id = ? AND measure_type_id = ?", @ProtegeCard.id.to_i , params[:id])
			@cardplot = Measurement.select("created_at, value").where("card_id = ? AND measure_type_id = ?", @ProtegeCard.id.to_i , params[:id])
		end
	end

	def create
	  	@measurement = Measurement.new(measurement_params)
	  	@card = Card.find_by(protege_id: session[:protege_id])
	  	@measurement.card_id = @card.id.to_i

	  	if @measurement.save
	  		@measurement.id = @measurement.measure_type_id
	  		flash[:success] = "Pomyślnie dodano do kartoteki"
	  		redirect_to @measurement
	  	else
	  		render 'new'
	  	end
	end

  	private

  	def measurement_params
  		params.require(:measurement).permit(:value,:measure_type_id)
  	end

end
