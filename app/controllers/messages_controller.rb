class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]

  # GET /messages
  def index
    # ransack用の検索条件を設定
    @search = Message.ransack(params[:q])
    # デフォルトのソート順を設定
    @search.sorts = "title asc" if @search.sorts.empty?
    # 検索結果をpageメソッドでページング
    @messages = @search.result.page(params[:page])
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1
  def show
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to @message, notice: "メッセージを登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      flash.now.notice = "メッセージを更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy!
    redirect_to messages_url, notice: "メッセージを削除しました。", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:title, :score)
    end
end
