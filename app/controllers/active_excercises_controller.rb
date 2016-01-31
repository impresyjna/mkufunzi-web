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

  def create_active_excercise_mobile
		if(!params[:training_id].nil? && !params[:protege_id].nil?)
			@old_active_excercise = ActiveExcercise.where("protege_id = ?", params[:protege_id])
			@old_active_excercise.destroy_all
			@active_excercise = ActiveExcercise.new(active_excercise_mobile)
			@active_excercise.save
			render json: {status: "success", active_excercise: @active_excercise}
		else
			render json: {status: "failure"}
		end
	end

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