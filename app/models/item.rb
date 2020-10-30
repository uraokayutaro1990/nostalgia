class Item < ApplicationRecord
  validates :text, presence: true
  #テキストが空だと登録出来ない
  belongs_to :user
  def self.search(search)
    if search != ""
      Item.where('text LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
