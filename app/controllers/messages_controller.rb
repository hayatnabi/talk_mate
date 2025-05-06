class MessagesController < ApplicationController
  before_action :require_user

  # POST /messages
  def create
    @message = current_user.messages.build(message_params)

    if @message.save
      ActionCable.server.broadcast("chatroom_channel", { message: render_message_partial(@message) })
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  private

  def render_message_partial(message)
    ApplicationController.renderer.render(partial: "messages/message", locals: { message: message })
  end

  def message_params
    params.require(:message).permit(:body)
    # params.require(:message).permit(:body, :user_id)
  end
end
