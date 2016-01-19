class EyeColorsController < ApplicationController
  #Pass all eye colors to mobile app.
  def get_eye_colors_mobile
    @eye_colors = EyeColor.all
    render json: @eye_colors
  end

end
