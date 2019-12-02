class TransactionController < ApplicationController
  def index; end

  def show
    @text = Message.all
  end

  def create
    texts = Message.new(text: params[:message])
    texts.save
  end
end
