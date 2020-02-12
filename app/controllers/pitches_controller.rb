class PitchesController < ApplicationController

    def index

    end

    def new

    end

    def create

    end

    def show
        @user = User.find(params[:id])
    end

    def edit

    end

    def update

    end

    def destroy

    end

    private
    
    def pitch_params
        params.require(:pitch).permit(:title, :summary, :genre, :video_link, :funding_goal, :user_id)
    end

end