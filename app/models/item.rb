class Item < ApplicationRecord
  validates :text, presence: true
  #テキストが空だと登録出来ない
  belongs_to :user
  has_one_attached :image
  #画像ファイルをitemテーブルのレコードに添付
  #itemテーブルにカラムを追加する必要なし
  def self.search(search)
    if search != ""
      Item.where('text LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
