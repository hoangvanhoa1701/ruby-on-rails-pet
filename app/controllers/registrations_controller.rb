class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        #params
        #<ActionController::Parameters {"authenticity_token"=>"viVCx5B1GfcNPeLieHQSYJ4VGhZFg0R9qHPvtR4GeT-vPnpfNSbhzdoVzZuA_QyciTdWHv_qJoitZfA0ygQ9FA", "user"=>#<ActionController::Parameters {"password"=>"123", "password_confirmation"=>"123"} permitted: false>, "commit"=>"Sign Up", "controller"=>"registrations", "action"=>"create"} permitted: false> 

        #params[:user]
        #<ActionController::Parameters {"password"=>"123", "password_confirmation"=>"123"} permitted: false>

        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Successfully created account!" 
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end