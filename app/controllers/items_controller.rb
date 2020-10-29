class ItemsController < ApplicationController

  before_action :set_item, only: [:edit, :show]
  # privateで設定したset_itemを代入する
  before_action :move_to_index, except: [:index, :show]
  # index.html.erbページにリダイレクト
  # ログインしていなくても、詳細ページに遷移できる仕様にするためにexcept: [:index, :show]としている

  def index
    @items = Item.includes(:user)
    # includesメソッドを使用したためallメソッドは省略
  end

  def new
    @item = Item.new
  end  

  def create
    Item.create(item_params)
    #	アイテムモデル保存する
    # praivateでitem_paramsで引用してくるものを指定
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  def edit
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end
  
  def show
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :text).merge(user_id: current_user.id)
    #アイテムの名前と写真だけを許可
    #mergeメソッドとは2つのハッシュを1つにする
  end

  def set_item
    @item = Tweet.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end




