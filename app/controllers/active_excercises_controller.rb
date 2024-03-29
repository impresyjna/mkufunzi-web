class ActiveExcercisesController < ApplicationController

  def show
  	@active_protege = current_user.trainer.proteges
  end

  def active
  	@active_protege = current_user.trainer.proteges
	respond_to do |format|
		format.js
	end 	
	end

  #Method called via phone when user starts training. In return it gives the telephone data about new active_excercise to allow later update
  def create_active_excercise_mobile
		if(!params[:training_id].nil? && !params[:protege_id].nil?)
			@old_active_excercise = ActiveExcercise.where("protege_id = ?", params[:protege_id])
			@old_active_excercise.each do |p|
				@done_excercise = DoneExcercise.new(p.attributes)
				@done_excercise.save
			end
			@old_active_excercise.destroy_all
			@active_excercise = ActiveExcercise.new(active_excercise_mobile)
			@training = Training.find(params[:training_id])
			if @training.start.blank?
				@training.start = Time.now.strftime("%Y-%m-%d %H:%M:%S")
			end
			@training.save
			@active_excercise.save
			render json: {status: "success", active_excercise: @active_excercise}
		else
			render json: {status: "failure"}
		end
	end

  #Method called via phone to update active_excercise with actual data from phone
  def update_active_excercise_mobile
		if(!params[:id].nil?)
			@active_excercise = ActiveExcercise.find(params[:id])
			if @active_excercise.update_attributes(active_excercise_mobile)
				render json: {status: "success"}
			else
				render json: {status: "failure"}
			end
		else
			render json: {status: "failure"}
		end
	end

  #Method called via phone when user wants to change excercise
  def end_active_excercise_mobile
		if(!params[:id].nil?)
			@active_excercise = ActiveExcercise.find(params[:id])
			@done_excercise = DoneExcercise.new(@active_excercise.attributes)
			if @done_excercise.save
				@active_excercise.destroy
				render json: {status: "success", done_excercise: @done_excercise}
			else
				render json: {status: "failure"}
			end
		else
			render json: {status: "failure"}
		end
	end

	private
	def active_excercise_mobile
		params.permit(:how_many, :excercise_type_id, :training_id, :time, :puls, :protege_id)
	end
end