class PitchesController < ApplicationController
    before_action :require_login

    def index
        user = User.find(params[:user_id])
        @pitches = user.pitches
    end

    def new
        @pitch = Pitch.new
    end

    def create
        @pitch = Pitch.new(pitch_params)
        if @pitch.save
            redirect_to user_pitch_path(@pitch.user, @pitch)
        else
            redirect_to new_user_pitch_path
        end
    end

    def show
        @pitch = Pitch.find(params[:id])
    end

    def edit
        @pitch = Pitch.find(params[:id])
    end

    def update
        @pitch = Pitch.find(params[:id])
        @pitch.update(pitch_params)
        redirect_to user_pitch_path(@pitch.user, @pitch)
    end

    def destroy
        @pitch = Pitch.find(params[:id])
        @pitch.destroy
        redirect_to user_pitches_path
    end

    private
    
    def pitch_params
        params.require(:pitch).permit(
            :title, 
            :summary, 
            :genre, 
            :video_link, 
            :funding_goal, 
            :user_id
        )
    end


end