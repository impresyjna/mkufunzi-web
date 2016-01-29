#CRUD for excercise type.
class ExcerciseTypesController < ApplicationController
  #Displaying all excercise type.
  def show
  	@excercise_types = ExcerciseType.all
  	@excercise_type = ExcerciseType.new
  end

  #Deleting selected excercise type.
  def delete
    ExcerciseType.find(params[:id]).destroy
    flash[:success] = "Type ćwiczeń został usunięty"
    redirect_to excercise_types_path
  end

  #Updating selected excercise type.
  def update
  	@excercise_type = ExcerciseType.find(params[:id])
  	if @excercise_type.update_attributes(excercise_type_params)
  		flash[:success] = "Pomyślnie zmieniono"
  		redirect_to excercise_types_path
  	else
  		flash[:danger] = "Nie udało sie zmienić"
  		redirect_to excercise_types_path
  	end
  end
	
  #Creating excercise type.
  def new
  	@excercise_type = ExcerciseType.new(excercise_type_params)
  	if @excercise_type.save
  		flash[:success] = "Typ ćwiczeń został dodany"
  	else
  		flash[:danger] = "coś poszło nie tak..."
  	end
  	redirect_to excercise_types_path
	end

	def excercise_types_index_mobile
		@excercise_types = ExcerciseType.all
		render json: @excercise_types
	end

  private
  	def excercise_type_params
  		params.require(:excercise_type).permit(:name, :formula)
  	end

end
