class MedicinesController < ApplicationController
  #Add new medicine to database.
  def new
  	@medicine = Medicine.new(medicine_params)
  	if @medicine.save
  		flash[:success] = "Lek został dodany"
  	else
  		flash[:danger] = "coś poszło nie tak..."
  	end
  	redirect_to my_medicines_path
  end

  #Displaying all current user medicines.
  def show
  	@my_medicines = User.find(current_user.id).protege.medicines
  	@medicine = Medicine.new
  	@medicine_time = MedicineTime.new
  end

  #Delete selected medicines.
  def destroy
    Medicine.find(params[:id]).destroy
    flash[:success] = "Lek został usunięty"
    redirect_to my_medicines_path
  end

  private

    def medicine_params
  		params.require(:medicine).permit(:name, :dose, :dose_unit, :protege_id)
  	end
end
