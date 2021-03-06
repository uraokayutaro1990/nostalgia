class ItemsController < ApplicationController

  before_action :set_item, only: [:edit, :show]
  # privateで設定したset_itemを代入する
  # あとでマイページをランダムで表示できるように
  before_action :move_to_index, except: [:index, :show, :search]
  # index.html.erbページにリダイレクト
  # ログインしていなくても、詳細ページに遷移できる仕様にするためにexcept: [:index, :show]としている

  def index
    @items = Item.includes(:user).sample(10)
    #  binding.pry
    # includesメソッドを使用したためallメソッドは省略、N＋1問題解決2回のアクセスで済む
  end
    # @items = Item.includes(:user)多分間違いコード
  def new
    @item = Item.new
  end  

  def create
    # Item.create(item_params)
    #  binding.pry
    item =Item.new(item_params)
      # binding.pry
    if item.save
      redirect_to current_user 
    else
      render "item/new"
    end
    #	アイテムモデル保存する
    # praivateでitem_paramsで引用してくるものを指定
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to current_user 

  end

  def edit
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end
  
  def show
  end

  def search
    @items = Item.search(params[:keyword])
  end

  private
  def item_params
    params.require(:item).permit(:text, :image ).merge(user_id: current_user.id)
    #アイテムの名前と写真だけを許可
    #mergeメソッドとは2つのハッシュを1つにする
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end

# 画像の保存を許可するストロングパラメーター




