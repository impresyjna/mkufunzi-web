class MeasurementsController < ApplicationController
	before_action :declared_user,   only: [:show, :new, :create]
	before_action :trainer_only,   only: [:my_protege_card]


	def my_protege_card
		@protege = Protege.joins(:user).find_by(user_id: params[:id])
		@protege_measurement = @protege.card.measurement
		@measureType = MeasureType.all
	end

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
		@ProtegeCard = User.find(session[:user_id]).protege.card
		
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

    def trainer_only
      if logged_in?
      	@trainer = Trainer.find_by(user_id: current_user.id.to_i)
        if @trainer.nil?
        	redirect_to root_path, :alert => "Access denied."
        else
        	if @trainer.id.to_i != Protege.find_by(user_id: params[:id]).trainer_id.to_i
        		redirect_to root_path, :alert => "Nie masz dostępu do tej karty"
        	end
        end
      else
        redirect_to root_path, :alert => "Access denied."
      end
    end

    def declared_user
      if logged_in?
        if Protege.find_by(user_id: current_user.id.to_i).nil?
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
