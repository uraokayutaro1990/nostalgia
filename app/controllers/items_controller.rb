class ItemsController < ApplicationController

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
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :text)
    #アイテムの名前と写真だけを許可
  end

end




