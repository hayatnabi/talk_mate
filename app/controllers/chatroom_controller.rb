class ChatroomController < ApplicationController
  # before_action :require_user, only: [:index]

  def index
    # @messages = Message.all
  end

  # def create
  #   message = Message.create(message_params)
  #   ActionCable.server.broadcast "chatroom_channel", message: message_render(message)
  # end

  # private

  # def message_params
  #   params.require(:message).permit(:content).merge(user_id: current_user.id)
  # end

  # def message_render(message)
  #   ApplicationController.renderer.render(partial: 'message', locals: { message: message })
  # end
end
