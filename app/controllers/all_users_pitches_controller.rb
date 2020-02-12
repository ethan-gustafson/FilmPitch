class AllUsersPitchesController < ApplicationController
    before_action :require_login

    def index
        @pitches = Pitch.all
    end

end