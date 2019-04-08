require 'csv'
# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
    token_list = []
    @token_user = params["token"]
    @valid = false
    filepath = Rails.root.join('app', 'assets', 'data', 'token_depargneur.csv')
    csv_options = { col_sep: ',' }
    CSV.foreach(filepath, csv_options) { |row| token_list << { name: row[0], used: row[1] } }
    token_list.each do |tok|
      if (tok[:name] == @token_user && tok[:used] == "no")
        @valid = true
        #tok[:used] = "yes"
      end
    end
    CSV.open(filepath, 'wb', csv_options) { |csv| token_list.each { |tok| csv << [tok[:name], tok[:used]] } }
    fail unless @valid
  end

  # POST /resource
  def create
    super
    token_list = []
    token_user = current_user.registration_token
    filepath = Rails.root.join('app', 'assets', 'data', 'token_depargneur.csv')
    csv_options = { col_sep: ',' }
    CSV.foreach(filepath, csv_options) { |row| token_list << { name: row[0], used: row[1] } }
    token_list.each do |tok|
      if (tok[:name] == token_user && tok[:used] == "no")
        tok[:used] = "yes"
      end
    end
    CSV.open(filepath, 'wb', csv_options) { |csv| token_list.each { |tok| csv << [tok[:name], tok[:used]] } }
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end



  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
