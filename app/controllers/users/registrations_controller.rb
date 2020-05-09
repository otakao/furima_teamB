# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @user =User.new
  end
  
  def create
    @user =User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "ユーザー「#{@user.nickname}」を登録しました。"
    else
      render 'new'
    end
  end

 
  private 
  def user_params
    params.require(:user).permit(:nickname,:email,:password,:checkbox,:first_name,:last_name,:first_name_furigana,:last_name_furigana,:birthday)
  end

end
