class PasswordsController < ApplicationController
  before_action :authenticate_request!, only: %i[update]

  def forgot
    return render json: { error: 'Email not present' } if params[:email].nil?

    user = User.find_by(email: params[:email].downcase)

    if user.present? && user.confirmed_at?
      user.generate_password_token!
      UserMailer.forgot_password(user).deliver_now
      render json: { status: 'ok' }, status: :ok
    else
      render json: { error: ['Email address not found. Please check and try again.'] }, status: :not_found
    end
  end

  def reset
    token = params[:token].to_s
    user = User.find_by(reset_password_token: token)

    if user.present? && user.password_token_valid?
      if user.reset_password!(params[:password])
        render json: { status: 'ok' }, status: :ok
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: ['The email link seems to be invalid. Try requesting for a new one.'] }, status: :not_found
    end
  end

  def update
    unless params[:password].present?
      render json: { error: 'Password not present' }, status: :unprocessable_entity
      return
    end

    if @current_user.reset_password!(params[:password])
      render json: { status: 'ok' }, status: :ok
    else
      render json: { errors: @current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
