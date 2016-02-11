class MeasurementsController < ApplicationController
	before_action :declared_user,   only: [:show, :new, :create], except: [:get_measurements_mobile, :post_measurement_mobile, :get_main_data]
	before_action :trainer_only,   only: [:my_protege_card]

	#Displaying my proteges card. Only for trainer.
	def my_protege_card
		@protege = Protege.joins(:user).find_by(user_id: params[:id])
		@protege_measurement = @protege.card.measurements
		@measureType = MeasureType.all
	end

	def index
	end

	#Preparing to add new record into measurements. Only for protege.
	def new
		if params[:id].nil?
			flash[:danger] = "Coś poszlo nie tak..."
			redirect_to 'cards'
		else
			@measurement = Measurement.new
			@measureTypeInfo = MeasureType.find(params[:id])
		end
	end

	#Displaying all current user measuremetns.
	def show
		@measureType = MeasureType.all
		@measurements = Measurement.new
		@current_user = User.find(session[:user_id])
		@ProtegeCard = @current_user.protege.card
		
		if params[:id].nil?
			@cardNew = nil
		else	
			@measureTypeInfo = @measureType.find(params[:id])
			@card = Measurement.where("card_id = ? AND measure_type_id = ?", @ProtegeCard.id.to_i , params[:id])
			@cardplot = Measurement.select("created_at, value, second_value").where("card_id = ? AND measure_type_id = ?", @ProtegeCard.id.to_i , params[:id])
			respond_to do |format|
		      format.html
		      format.pdf do
		        pdf = CardPdf.new(@card,@measureTypeInfo,@current_user)
		        send_data pdf.render, filename: 'card.pdf', type: 'application/pdf', disposition: 'inline'
		      end
		    end
		end
	end

	#Add new measurement to database.
	def create
	  	@measurement = Measurement.new(measurement_params)
	  	@card = Card.find_by(protege_id: protege.id)
	  	@measurement.card_id = @card.id.to_i

	  	if @measurement.save
	  		@measurement.id = @measurement.measure_type_id
	  		flash[:success] = "Pomyślnie dodano do kartoteki"
	  		redirect_to measurement_path(id:@measurement.id.to_i)
	  	else
	  		flash[:danger] = "Podana wartość nie jest liczbą"
	  		redirect_to measurement_path(id:@measurement.measure_type_id.to_i)
	  	end
	end

	#Displaying measurements for mobile app.
	def get_measurements_mobile
		if !params[:card_id].nil? and !params[:measure_type_id].nil?
			@measurements = Measurement.where("card_id = ? and measure_type_id = ?", params[:card_id], params[:measure_type_id]).order(created_at: :desc)
			render json: @measurements
		else
			render json: Measurement.all.order(created_at: :desc)
		end
	end

	#Add new measurements from mobile app.
	def post_measurement_mobile
		if !params[:value].nil? and !params[:card_id].nil? and !params[:measure_type_id].nil?
			@measurement = Measurement.new(measurement_mobile)
			if @measurement.save
				render json: {status: "success" }
			else
				render json: {status: "failure" }
			end
		else
			render json: {status: "failure" }
		end
	end

	#Get data from database for current user to display welcome info.
	def get_main_data
		if !params[:id].nil?
			@user = User.find(params[:id])
			@protege = @user.protege
			@card = @protege.card
			@weight = @card.measurements.where(measure_type_id: (MeasureType.find_by(name: "Waga"))).last
			@height = @card.measurements.where(measure_type_id: (MeasureType.find_by(name: "Wzrost"))).last
			@message = Message.where(user_receive_id: params[:id]).last
			@last_training = @protege.training.last
			if @height.nil?
				@height = Measurement.new
			end
			if @weight.nil?
				@weight = Measurement.new
			end
			if @message.nil?
				@message = Message.new
			end
			if @last_training.nil?
				@last_training = Training.new
			end
			render json: {status: "success",
										weight_value: @weight.value, weight_unit: MeasureType.find_by(name: "Waga").unit,
										height_value: @height.value, height_unit: MeasureType.find_by(name: "Wzrost").unit,
										message: @message.content, training: @last_training.start }
		else
			render json: {status: "failure"}
		end
	end

  	private

  	#Returns true if current user is trainer.
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

    #Return true if current user is protege.
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
  		params.require(:measurement).permit(:value,:measure_type_id,:second_value)
	end

	def measurement_mobile
		params.permit(:value, :card_id, :measure_type_id, :second_value)
	end

end
