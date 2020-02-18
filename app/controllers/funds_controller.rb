class FundsController < ApplicationController
    before_action :require_login

    def new
        @pitch = Pitch.find_by(id: params[:pitch_id])
        @fund = @pitch.funds.build
    end

    def create
        @fund = current_user.funds.build(fund_params)

        if @fund.save
            @fund.user.transaction(@fund.amount)
            @fund.pitch.user_fund(@fund.amount)
            redirect_to pitch_path(@fund.pitch_id)
        else
            render :new
        end
    end

    private
    
    def fund_params
        params.require(:fund).permit( 
            :pitch_id, 
            :amount
        )
    end

end