class StaticPagesController < ApplicationController
  def home
  	if logged_in? 
  		if params[:commit] == 'Jestem podopiecznym'
  			flash.now[:danger] = 'Jestem podopiecznym'
  		elsif params[:commit] == 'Jestem trenerem'
  			flash.now[:danger] = 'Jestem trenerem'
  		end	
      if !Protege.find_by(user_id: current_user.id.to_i).nil?
        @protege = current_user.protege
        @card = @protege.card
        @medicines = @protege.medicines
        #@last_measurements = @card.measurements.where("`measurements`.`id` in (select max(`measurements`.`id`) from measurements where card_id = ? group by measure_type_id)",@card.id.to_i).joins(:measure_type)
        @last_measurements = @card.measurements.where('"measurements"."id" in (select max("measurements"."id") from measurements where card_id = ? group by measure_type_id)',@card.id.to_i).joins(:measure_type)
        if !@last_measurements.where("measure_types.name = ? ","Waga").empty? and !@last_measurements.where("measure_types.name = ? ","Wzrost").empty?
          waga = @last_measurements.where("measure_types.name = ? ","Waga").last.value 
          wzrost = @last_measurements.where("measure_types.name = ? ","Wzrost").last.value / 100
          @bmi = bmi(waga,wzrost)
          @interpretate_bmi = interpretate_bmi(@bmi)
          @show_bmi_box = true
        else
          @show_bmi_box = false
        end
      end

  	end
  end

  def about
  	
  end

  def create

  end

  def contact

  end

  private
    def bmi(height,weight)
      return height / (weight*weight)
    end

    def interpretate_bmi(value)
      if value < 18.5
        return 'niedowaga'
      elsif value < 24.9 
        return 'prawidłowa masa ciała'
      elsif value < 29.9 
        return 'nadwaga'
      elsif value < 40
        return 'otyłość'
      else
        return 'otyłość olbrzymia'
      end
    end

end
