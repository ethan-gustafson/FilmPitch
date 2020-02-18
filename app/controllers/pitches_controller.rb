class PitchesController < ApplicationController
    before_action :require_login

    def index
        if params[:user_id] # if there is a user_id param
            user = User.find(params[:user_id]) # we will then find the user.
            @pitches = user.pitches # @pitches will then be equal to the users pitches.
        else
            @pitches = Pitch.all # but if there is no valid user_id or if it is missing, we will show index of all pitches.
        end
    end

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
        set_pitch
    end 

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