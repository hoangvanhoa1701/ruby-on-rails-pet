class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "Login successfully!"

            # if session[:back_url].present?
            #     redirect_to session[:back_url], notice: "Login successfully!"
            # else
            #     redirect_to root_path, notice: "Login successfully!"
            # end
        else
            flash[:alert] = "Invalid email or password!"
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out!"
    end
end