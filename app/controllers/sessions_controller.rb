class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to user, notice: "Bem vindo, #{user.name}!"
    else
      render :new, notice: "Email/senha inválido!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Você foi desconectado"
  end
end
