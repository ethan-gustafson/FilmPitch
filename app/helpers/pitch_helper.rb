module PitchHelper

    def set_pitch
        @pitch = Pitch.find(params[:id])
    end

end