class MedicineTimesController < ApplicationController
  def new
  	@medicine_time = MedicineTime.new
  end

  def create
  	@medicine_time = MedicineTime.new(medicine_time_params)
  	if @medicine_time.save
  		flash[:success] = "dozowanie zostalo dodane"
  	else
  		flash[:danger] = "coś poszło nie tak..."
  	end
  	redirect_to my_medicines_path
  end

  private
  	def medicine_time_params
    	params.require(:medicine_time).permit(:medicine_time, :remind, :remind_when, :medicine_id)
    end
end
