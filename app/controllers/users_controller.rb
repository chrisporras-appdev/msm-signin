class UsersController < ApplicationController
  def render_sign_up
    render({:template => "user_templates/sign_up.html.erb"})
  end

  def add_user
    u = User.new
    u.email = params.fetch("user_email")
    u.first_name = params.fetch("user_first_name")
    u.last_name = params.fetch("user_last_name")
    u.password = params.fetch("user_password")
    confirmed_password = params.fetch("user_password_confirmation")

    if  u.password == confirmed_password
      u.save
      session.store(:user_id, u.id)
      @signed_in = true
      redirect_to("/", {:notice => "Signed up successfully."})
    else
      error_message = u.errors.full_messages

      redirect_to("/user_sign_up", {:alert => error_message.to_sentence})
    end
  end

  def render_sign_in
    render({:template => "/user_templates/sign_in.html.erb"})
  end

  def sign_in_user
    user_email = params.fetch("user_email")
    user_password = params.fetch("user_password")

    u = User.where(:email => user_email).at(0)

    if u.password == user_password
      user_id = session.store(:user_id, u.id)
      @signed_in = true
      redirect_to("/", {:notice => "Signed in successfully."})
    else
      redirect_to("/user_sign_in", {:alert => error_message.to_sentence})
    end
  end

  def sign_out_user
    @signed_in = false

  end

  

end