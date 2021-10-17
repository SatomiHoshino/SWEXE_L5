class TweetsController < ApplicationController
    def index
        @tweet = Tweet.all
        @top = Top.all
    end
    
    def new
       @tweet = Tweet.new
    end
    
    def create
       message = params[:tweet][:message]

       @tweet = Tweet.new(message: message)
       if @tweet.save
           flash[:notice] = 'ツイートしました'
           redirect_to tweets_path
       else
           render 'new'
       end
    end
    
    def destroy
       tweet = Tweet.find(params[:id])
       tweet.destroy
       redirect_to tweets_path
    end
end
