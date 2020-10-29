class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    # 変数ユーザーを定義
    @nickname = user.nickname
    @items = user.items
    # これまではカレントユーザーの詳細ページしか見れなかった
    # ニックネームをクリックするとクリックしたユーザーのアイテム一覧がみれる
  end
end



