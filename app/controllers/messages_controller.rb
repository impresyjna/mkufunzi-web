class MessagesController < ApplicationController
  
  def show
  	@trainer = Protege.find_by(user_id: current_user.id).trainer
  	@messages = Message.where("user_send_id = ? AND user_receive_id = ? OR user_send_id = ? AND user_receive_id = ?",@trainer.user.id.to_i,current_user.id,current_user.id,@trainer.user.id.to_i)
  end

  def new
  	@message = Message.new(message_params)
  	@message.save
  	redirect_to messages_path
  end

  private

    def message_params
  		params.require(:message).permit(:content, :user_send_id, :user_receive_id)
  	end

end
