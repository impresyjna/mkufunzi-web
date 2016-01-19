class MedicineTimesController < ApplicationController
  #Prepare data to add to database
  def new
  	@medicine_time = MedicineTime.new
  end

  #Adding new record to database.
  def create
  	@medicine_time = MedicineTime.new(medicine_time_params)
  	if @medicine_time.save
  		flash[:success] = "dozowanie zostalo dodane"
  	else
  		flash[:danger] = "coś poszło nie tak..."
  	end
  	redirect_to my_medicines_path
  end

  #Destroy medicine time.
  def destroy
    MedicineTime.find(params[:id]).destroy
    flash[:success] = "Dozowanie zostało usunięte "
    redirect_to my_medicines_path
  end

  private
  	def medicine_time_params
    	params.require(:medicine_time).permit(:medicine_time, :remind, :remind_when, :medicine_id)
    end
end
