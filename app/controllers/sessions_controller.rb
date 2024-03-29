class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by({"email" => params["email"] })
    if user && user.password == BCrypt::Password.new(user.password)
      session["user_id"] = user.id
      redirect_to "/"
    else
      redirect_to "/sessions/new"
    end
  end

  def destroy
    session["user_id"] = nil
    redirect_to "/login"
  end
end
  