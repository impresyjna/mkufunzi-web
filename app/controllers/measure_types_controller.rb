class MeasureTypesController < ApplicationController
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

  private

  	def measuretype_params
  		params.require(:measure_type).permit(:name, :unit)
  	end
end
