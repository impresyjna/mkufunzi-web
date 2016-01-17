class ExcerciseTypesController < ApplicationController
  def show
  	@excercise_types = ExcerciseType.all
  	@excercise_type = ExcerciseType.new
  end

  def edit
  end

  def delete
    ExcerciseType.find(params[:id]).destroy
    flash[:success] = "Type ćwiczeń został usunięty"
    redirect_to excercise_types_path
  end

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
	
  def new
  	@excercise_type = ExcerciseType.new(excercise_type_params)
  	if @excercise_type.save
  		flash[:success] = "Typ ćwiczeń został dodany"
  	else
  		flash[:danger] = "coś poszło nie tak..."
  	end
  	redirect_to excercise_types_path
  end

  private
  	def excercise_type_params
  		params.require(:excercise_type).permit(:name, :formula)
  	end

end
