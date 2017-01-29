class IncentivesController < ApplicationController
  layout "teslas_layout"

  before_action :set_incentive, only: :destroy

  def index
    @incentives = Incentive.all
  end

  def new
    @incentive = Incentive.new
  end

  def create
    @incentive = Incentive.new(incentive_params)
    if @incentive.save
      redirect_to incentives_path, notice: 'Incentive was successfully created.'
    else
      render :new, alert: 'Unable to add incentive.'
    end
  end

  def destroy
    @incentive.destroy
    redirect_to incentives_url, notice: 'Incentive was successfully destroyed.'
  end

  private
    def set_incentive
      @incentive = Incentive.find(params[:id])
    end

    def incentive_params
      params.require(:incentive).permit(
        :state,
        :state_code,
        :amount
      )
    end
end
