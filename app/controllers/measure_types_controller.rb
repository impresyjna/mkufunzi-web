class MeasureTypesController < ApplicationController
  #before_filter :declared_user, except: [:index_mobile]

  def show
  	@measureType = MeasureType.all
  end

  def new
  	@measureType = MeasureType.new
  end

  def create
  	@measureType = MeasureType.new(measuretype_params)
  	if @measureType.save
  		flash[:success] = "Pomyślnie dodano do kartoteki"
  		redirect_to @measureType
  	else
  		render 'new'
  	end
  end

  def index_mobile
    @measure_types = MeasureType.all
    render json: @measure_types
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

    def admin_only
      unless current_user.admin?
        redirect_to root_path, :alert => "Access denied."
      end
    end

  	def measuretype_params
  		params.require(:measure_type).permit(:name, :unit)
  	end
end
