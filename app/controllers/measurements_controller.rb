class MeasurementsController < ApplicationController
	before_filter :declared_user

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
		@measurements = Measurement.new
		@ProtegeCard = User.find(session[:user_id]).proteges.find_by(user_id: session[:user_id]).card
		
		if params[:id].nil?
			@cardNew = nil
		else	
			@measureTypeInfo = @measureType.find(params[:id])
			@card = Measurement.where("card_id = ? AND measure_type_id = ?", @ProtegeCard.id.to_i , params[:id])
			@cardplot = Measurement.select("created_at, value").where("card_id = ? AND measure_type_id = ?", @ProtegeCard.id.to_i , params[:id])
		end
	end

	def create
	  	@measurement = Measurement.new(measurement_params)
	  	@card = Card.find_by(protege_id: protege.id)
	  	@measurement.card_id = @card.id.to_i

	  	if @measurement.save
	  		@measurement.id = @measurement.measure_type_id
	  		flash[:success] = "Pomyślnie dodano do kartoteki"
	  		redirect_to measurement_path(id:@measurement.id.to_i)
	  	else
	  		render 'new'
	  	end
	end

  	private

    def declared_user
      if logged_in?
        if Protege.find_by(user_id: current_user.id.to_i).nil? and Trainer.find_by(user_id: current_user.id.to_i).nil?
        redirect_to root_path, :alert => "Access denied."
        end
      else
        redirect_to root_path, :alert => "Access denied."
      end
    end

  	def measurement_params
  		params.require(:measurement).permit(:value,:measure_type_id)
  	end

end
