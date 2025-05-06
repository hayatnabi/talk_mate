class MessagesController < ApplicationController
  before_action :require_user

  # before_action :set_message, only: %i[show update destroy]
  # before_action :set_conversation, only: %i[index create]

  # GET /messages
  # def index
  #   @messages = @conversation.messages

  #   render json: @messages
  # end

  # GET /messages/1
  # def show
  #   render json: @message
  # end

  # POST /messages
  def create
    @message = current_user.messages.build(message_params)

    if @message.save
      ActionCable.server.broadcast "chatroom_channel", foo: message.body
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1
  # def update
  #   if @message.update(message_params)
  #     render json: @message
  #   else
  #     render json: @message.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /messages/1
  # def destroy
  #   @message.destroy
  # end

  private

  # def set_message
  #   @message = Message.find(params[:id])
  # end

  # def set_conversation
  #   @conversation = Conversation.find(params[:conversation_id])
  # end

  def message_params
    params.require(:message).permit(:body)
    # params.require(:message).permit(:body, :user_id)
  end
end
