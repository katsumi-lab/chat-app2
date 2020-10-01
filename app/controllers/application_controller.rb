class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  #deviseのコントローラーが呼び出されたらconfigure_permitted_parametersが呼ばれる。
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters #deviseでユーザー登録をする際に追加したnameカラムのキーの内容を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
