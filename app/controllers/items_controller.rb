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
  end

  def edit
    @item = Item.find(params[:id])
    
  end

  private
  def item_params
    params.require(:item).permit(:name, :image)
    #アイテムの名前と写真だけを許可
  end

end




