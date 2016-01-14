class EyeColorsController < ApplicationController
  def get_eye_colors_mobile
    @eye_colors = EyeColor.all
    render json: @eye_colors
  end

end
