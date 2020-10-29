class Item < ApplicationRecord
  validates :text, presence: true
  #テキストが空だと登録出来ない
  belongs_to :user
end
