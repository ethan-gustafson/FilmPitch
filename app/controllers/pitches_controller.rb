class PitchesController < ApplicationController
    before_action :require_login

    def index
        user = User.find(params[:user_id]) # if user_id and find a user using that user_id
        @pitches = user.pitches
    end # if nested - do this - set pitch to be pitch.all 

    def new
        @pitch = Pitch.new
    end

    def create
        @pitch = Pitch.new(pitch_params)
        if @pitch.save
            redirect_to pitch_path(@pitch)
        else
            render :new
        end
    end

    def show
       set_pitch # set pitch
    end # could add protection against deleted pitches in url

    def edit
        set_pitch
    end

    def update
        set_pitch
        if set_pitch.update(pitch_params)
            redirect_to pitch_path(set_pitch)
        else
            render :edit
        end
    end

    def destroy
        set_pitch
        set_pitch.destroy
        redirect_to user_pitches_path(current_user)
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