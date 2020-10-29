class ItemsController < ApplicationController

  before_action :set_item, only: [:edit, :show]
  # privateで設定したset_itemを代入する

  def index
    @items = Item.all
    # Itemはモデルから全てデータを持ってくる意味
  end

  def new
    @item = Item.new
  end  

  def create
    Item create(item_params)
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
    params.require(:item).permit(:name, :image, :text)
    #アイテムの名前と写真だけを許可
  end

  def set_item
    @item = Tweet.find(params[:id])
  end

end




