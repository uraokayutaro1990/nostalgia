class ItemsController < ApplicationController
  def index
    @items = Item.all
    #Itemはモデルから全てデータを持ってくる意味
  end

  def
    @item = Item.new
  end
  
end  
