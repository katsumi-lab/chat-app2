class UsersController < ApplicationController
  def edit
    
  end

  def update
    if current_user.update(user_params) #ログインユーザーが保存できたら
      redirect_to root_path #チャット画面に遷移
    else #保存できなかったら
      render :edit #editのビューが表示される
    end
  end

  private

  def user_params 
    params.require(:user).permit(:name, :email) #userのnameとemailを取得すると定義
  end
end
