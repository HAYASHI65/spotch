class CardsController < ApplicationController
  def new
  end

  def create
    # 生成したカードトークンをもとに、顧客トークン（顧客情報）を生成
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 秘密鍵：クライアントサイドでトークン化された情報をサーバーサイドで受け取ったのち、PAYJPへその情報を送り決済処理を行うために必要
    customer = Payjp::Customer.create(
      description: 'test', # テストカードであることを説明
      card: params[:card_token] # 登録しようとしているカード情報 = cad.jsで定義した「token情報を持つinput要素」のname属性
    )
    # 顧客トークンとログインしているユーザーを紐付けるインスタンスを生成
    card = Card.new(
      card_token: params[:card_token], # attr_accessorで追加したcard_tokenキーに対する、カード情報params[:card_token])
      customer_token: customer.id,  # 顧客トークン
      user_id: current_user.id # ログインしているユーザー
    )
    if card.save
      redirect_to root_path
    else
      redirect_to new_card_path
    end
  end

  def show # 「マイページは誰でも見られる、且つクレジット登録は任意」を実現するため、クレジット情報の詳細はusers/showではなく、cards/showビューに表示することにした
    @user = User.find(params[:id])

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(user_id: @user.id)

    customer = Payjp::Customer.retrieve(card.customer_token) # 一行上で定義したカード情報のcustomer_tokenカラムを元に、Payjpから顧客情報を取得
    @card = customer.cards.first
  end
end

# 具体的なカード情報（カード番号など）をそのままデータベースに保存することは法律上禁止されているが、トークン化された顧客情報であれば保存可能。
#この顧客トークンをユーザー情報に紐付けることで、繰り返し使用できるようになる。こうすることで、毎回カード情報を入力をしなくても寄付が可能になる。