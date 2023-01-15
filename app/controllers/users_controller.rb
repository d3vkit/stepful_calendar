# frozen_string_literal: true

class UsersController < ApplicationController
  def change
    raise ArgumentError, 'User type cookie is not set!' unless cookies[:user_type]

    cookies[:user_type] = cookies[:user_type] == 'Coach' ? 'Student' : 'Coach'

    redirect_to root_path
  end

  def change_to
    cookies[:user_type] = params[:user_type]

    render plain: 'OK'
  end
end
