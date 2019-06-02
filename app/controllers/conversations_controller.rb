class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.all
  end

  def create
    if company_signed_in? || user_signed_in?
      if Conversation.between(params[:company_id], params[:user_id]).present?
        @conversation = Conversation.between(params[:company_id], params[:user_id]).first
      else
        @conversation = Conversation.create!(conversation_params)
      end
      redirect_to conversation_messages_path(@conversation)
      end
  end

  private
  def conversation_params
    params.permit(:company_id,:user_id)
  end
end
