class BloodTypesController < ApplicationController
  def get_blood_types_mobile
    @blood_types = BloodType.all
    render json: @blood_types
  end
end
