class Item < ApplicationRecord
  validates :text, presence: true
  #テキストが空だと登録出来ない
end
