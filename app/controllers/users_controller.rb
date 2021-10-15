class UsersController < ApplicationController
    def index
        @user = User.all
        @top = Top.all
    end
    
    def new
        @user = User.new
    end
    
    def create
        uid = params[:user][:uid]
        pass = params[:user][:pass]
        @user = User.new(uid: uid, pass: pass)
        if @user.save
            flash[:notice] = '[１メッセージ追加しました]'
            redirect_to users_path
        else
            render 'new'
        end
    end
    
    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to users_path
    end
end
