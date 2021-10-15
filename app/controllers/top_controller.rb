class TopController < ApplicationController
    def login_form
        @top = Top.all
        @tweet = Tweet.all
    end
    
    def main
        if session[:login_uid]
            @tweet = Tweet.all
            render 'main'
        else
            render 'login'
        end
    end
    
    def login
        @tweet = Tweet.all
        @user = User.all
        if User.find_by(uid: params[:uid])
            pass = BCrypt::Password.create(params.require(:pass))
            if BCrypt::Password.new(pass) == params[:pass]

                session[:login_uid] = params[:uid]
                redirect_to root_path
            else
                render 'login_failed'
            end
        else
            render 'login_failed'
        end
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end

end
