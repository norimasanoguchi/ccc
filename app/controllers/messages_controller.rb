class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages
    @user = @conversation.user
    @user_id = @user.id
    @company_id = @conversation.company.id

    if @messages.length > 10
      @over_ten = true
      @messages = Message.where(id: @messages[-10..-1].pluck(:id))
    end

    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end

    # if @messages.last
    #   #自分の投稿じゃないメッセージをread:trueに
    #     @messages.where.not(company_id: current_company.id).update_all(read: true) if current_company.present?
    #     @messages.where.not(user_id: current_user.id).update_all(read: true) if current_user.present?
    # end
    @messages.where(company_id: current_company.id).update_all(read: true) if company_signed_in?
    @messages.where(user_id: current_user.id).update_all(read: true) if user_signed_in?

    @messages = @messages.order(:created_at)
    @message = @conversation.messages.build
  end

  def create
    @message = @conversation.messages.build(message_params)
    if @message.save!
      redirect_to conversation_messages_path(@conversation)
    else
      render 'index'
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id,:company_id)
  end

end
