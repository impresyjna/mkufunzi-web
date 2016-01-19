class BloodTypesController < ApplicationController
  
	#Returm values of all blood types and pass it to json.
  def get_blood_types_mobile
    @blood_types = BloodType.all
    render json: @blood_types
  end
end
