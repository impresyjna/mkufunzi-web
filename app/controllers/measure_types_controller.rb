#
class MeasureTypesController < ApplicationController
  #before_filter :declared_user, except: [:index_mobile]

  #Display all measure type.
  def show
  	@measureType = MeasureType.all
    @measureTypeNew = MeasureType.new
  end

  #Preparing to add new record into database.
  def new
  	@measureType = MeasureType.new
  end

  #Add new record into measure type.
  def create
    measuretype_params[:name][0] = measuretype_params[:name][0].capitalize
  	@measureType = MeasureType.new(measuretype_params)
  	if @measureType.save
  		flash[:success] = "Pomyślnie dodano do kartoteki"
  		redirect_to @measureType
  	else
  		render 'new'
  	end
  end

  #Displaying selected measure type.
  def edit
    @measureType = MeasureType.find(params[:id])
  end

  #Updating previous selected data.
  def update
    @measureType = MeasureType.find(measuretype_params[:id])
    measuretype_params[:name][0] = measuretype_params[:name][0].capitalize
    if @measureType.update_attributes(measuretype_params)
      flash[:success] = "Typ pomiaru został zmieniony"
      redirect_to measure_type_path
    else
      flash[:danger] = "Cos poszło nie tak..."
      redirect_to measure_type_path
    end
  end

  #Deleting previous selected data.
  def destroy
    MeasureType.find(params[:id]).destroy
    flash[:success] = "MeasureType został usunięty "
    redirect_to measure_type_path
  end

  #Displayin all measure type for mobile app.
  def index_mobile
    @measure_types = MeasureType.all
    render json: @measure_types
  end

  private
    #Returns true if current user is declared. It means that user is protege or trainer.
    def declared_user
      if logged_in?
        if Protege.find_by(user_id: current_user.id.to_i).nil? and Trainer.find_by(user_id: current_user.id.to_i).nil?
        redirect_to root_path, :alert => "Access denied."
        end
      else
        redirect_to root_path, :alert => "Access denied."
      end
    end

    #Returns true if current user is admin.
    def admin_only
      unless current_user.admin?
        redirect_to root_path, :alert => "Access denied."
      end
    end

  	def measuretype_params
  		params.require(:measure_type).permit(:name, :unit, :extra_field, :first_label, :second_label)
  	end

    def measuretype_params
      params.require(:measure_type).permit(:id, :name, :unit, :extra_field, :first_label, :second_label)
    end
end
