class TeslasController < ApplicationController
  before_action :set_tesla, only: [:show, :edit, :update, :destroy]

  def index
    @teslas = Tesla.all
  end

  def show
  end

  def new
    @tesla = Tesla.new
  end

  def edit
  end

  def create
    @tesla = Tesla.new(tesla_params)
    if @tesla.save
      redirect_to teslas_path, notice: 'Tesla was successfully created.'
    else
      redirect_to teslas_path, alert: 'Unable to add tesla.'
    end
  end

  def update
    respond_to do |format|
      if @tesla.update(tesla_params)
        format.html { redirect_to @tesla, notice: 'Tesla was successfully updated.' }
        format.json { render :show, status: :ok, location: @tesla }
      else
        format.html { render :edit }
        format.json { render json: @tesla.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tesla.destroy
    respond_to do |format|
      format.html { redirect_to teslas_url, notice: 'Tesla was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_tesla
      @tesla = Tesla.find(params[:id])
    end

    def tesla_params
      params.require(:tesla).permit(
        :model,
        :trim,
        :price,
        :insurance,
        :maintenance,
        :taxes_and_fees,
        :financing,
        :depreciation,
        :fuel,
        :tax_credit,
        :total
      )
    end
end
