class MessagesController < ApplicationController
    
  def new_message
    @new_messages = Message.where("user_send_id = ? AND user_receive_id = ? AND id > ?",params[:r_id], current_user.id,params[:after].to_i)
  end

  def show
    if !current_user.protege.nil?
  	   @trainer = Protege.find_by(user_id: current_user.id).trainer
  	   @messages = Message.where("user_send_id = ? AND user_receive_id = ? OR user_send_id = ? AND user_receive_id = ?",@trainer.user.id.to_i,current_user.id,current_user.id,@trainer.user.id.to_i)
    end
    if !current_user.trainer.nil?
      @my_proteges = current_user.trainer.proteges
      if !params[:id].nil?
        @messages = Message.where("user_send_id = ? AND user_receive_id = ? OR user_send_id = ? AND user_receive_id = ?",params[:id],current_user.id,current_user.id,params[:id]) 
      end
    end
  end

  def new
  	@message = Message.new(message_params)
  	@message.save
    if !current_user.trainer.nil?
  	 redirect_to messages_path(id: message_params[:user_receive_id])
    else
      redirect_to messages_path
    end
  end

  private

    def message_params
  		params.require(:message).permit(:content, :user_send_id, :user_receive_id)
  	end

end
