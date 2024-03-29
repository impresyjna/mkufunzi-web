
class MessagesController < ApplicationController
    
  #Checking if current user received message from another user.  
  def new_message
    @new_messages = Message.where("user_send_id = ? AND user_receive_id = ? AND id > ?",params[:r_id], current_user.id,params[:after].to_i)
  end

  #Displays all current user messages.
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

  #Add new message to database, sent by current user to specified one.
  def new
  	@message = Message.new(message_params)
  	@message.save
    if !current_user.trainer.nil?
  	 redirect_to messages_path(id: message_params[:user_receive_id])
    else
      redirect_to messages_path
    end
  end

  #Method called via phone to get all messages from user to his trainer and from trainer to user. In return it shows json with all data
  def my_messages_index_mobile
    if !params[:id].nil?
      @user = User.find(params[:id])
      @trainer = User.find(Protege.find_by(user_id: @user.id).trainer.user_id)
      @messages = Message.where("user_send_id = ?  OR user_receive_id = ?", @user.id, @user.id)
      render json: {status: "success", messages: @messages, trainer: { name: @trainer.name, surname: @trainer.surname }}
    else
      render json: {status: "failure"}
    end
  end

  #Method called via phone to send message. It creates the message using send data and saves it in database. In return it gives the message about success or failure
  def create_message_mobile
    @message = Message.new(message_mobile)
    if @message.save
      render json: {status: "success"}
    else
      render json: {status: "failure"}
    end
  end

  private

    def message_params
  		params.require(:message).permit(:content, :user_send_id, :user_receive_id)
    end

    def message_mobile
      params.permit(:content, :user_send_id, :user_receive_id)
    end

end
