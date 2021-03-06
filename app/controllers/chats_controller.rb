class ChatsController < ApplicationController

  before_action :authenticate_user!
  before_action :move_to_index, only: [:show]

  def index
    rooms = current_user.user_rooms.pluck(:room_id) # 「ログイン中ユーザーに紐付く、user_roomsテーブルのroom_id」を全て取得
    @chat_rooms = UserRoom.where(room_id: rooms).order("created_at DESC")    # 「ログイン中ユーザーに紐付くroom_id」と等しいroom_idを持つuser_roomsを全て取得
  end

  def show
    @user = User.find(params[:id])

    rooms = current_user.user_rooms.pluck(:room_id)
    user_room = UserRoom.find_by(user_id: @user.id, room_id: rooms)  # このuser_roomsが、トークルームのroom_idをもつ中間テーブル

    if user_room.nil? # トークルームのroom_idをもつ中間テーブルが存在しない場合は、トークルーム(@room)を新しく作る
      @room = Room.new
      @room.save

      UserRoom.create(user_id: @user.id, room_id: @room.id)         # 上段で作成した@roomのidを使い、話し相手と自分、共通の@room.idをもつuser_roomsを作る。
      UserRoom.create(user_id: current_user.id, room_id: @room.id)  # これにより上段で作成した@roomを、2人の新しいトークルームとして使うことができる。
    else
      @room = user_room.room # トークルームのroom_idをもつ中間テーブルが存在する場合は、その中間テーブルに紐づくroomを取り出し、トークルーム(@room)に代入する
    end

    @chats = @room.chats.order('created_at DESC') # 2人のトークルームに紐づく全てのチャットを取得＝これがチャット履歴となり、ビューでeach文を使い一つずつ抽出する
    @chat = Chat.new(room_id: @room.id) # 新しくチャットを打ち、form_withのcreateアクションへ繋げるため、メッセージカラムが空の@chatインスタンスを生成。
    # ただし、「どのトークルームのチャットなのか」はここで記述する必要がある。ここで渡しておかないと、メッセージのroom_idに渡すチャンスがなくなる
  end

  def create
    @chat = Chat.new(chat_params)
    respond_to do |format|
      if @chat.save
        format.html { redirect_to @chat } # showアクションを実行し、詳細ページを表示
        format.js # create.js.erbが呼び出される
      else
        format.html { render :show } # show.html.erbを表示
        format.js { render :errors } # 一番最後に実装の解説あります
      end
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :room_id).merge(user_id: current_user.id)
  end

  def move_to_index
    @user = User.find(params[:id])
    redirect_to root_path if current_user.id == @user.id
  end
end
