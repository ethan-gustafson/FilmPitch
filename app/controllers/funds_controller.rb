class FundsController < ApplicationController
    before_action :require_login

    def new
        @fund = Fund.new
        @pitch = Pitch.find_by(id: params[:pitch_id])
    end

    def create
        @fund = Fund.new(fund_params)
        if @fund.save
            @fund.user.transaction(@fund.amount)
            @fund.pitch.user_fund(@fund.amount)
            redirect_to pitch_path(@fund.pitch_id)
        else
            redirect_to pitches_path
        end
    end

    private
    
    def fund_params
        params.require(:fund).permit(
            :user_id, 
            :pitch_id, 
            :amount
        )
    end


end