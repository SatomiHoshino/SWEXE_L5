class TopController < ApplicationController
    def login_form
        @top = Top.all
        @tweet = Tweet.all
        @user = User.all
        if session[:main]
            render 'main'

        end
    end
    
    def main
        if session[:login_uid]
            @tweet = Tweet.all
            @user = User.all
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
                render 'main'
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
    
    def create
        tweet = Tweet.find(params[:tweet_id])
        user = User.find_by(uid: session[:login_uid])
        user.top_tweets << tweet
        redirect_to root_path
    end
    
    def destroy
        tweet = Tweet.find(params[:id])
        user = User.find_by(uid: session[:login_uid])
        tweet.tops.find_by(user_id: user.id).destroy
        redirect_to root_path
    end

end
