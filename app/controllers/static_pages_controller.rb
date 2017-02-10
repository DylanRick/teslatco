class StaticPagesController < ApplicationController
  before_action :load_makes
  respond_to :html, :js

  def index
  end

  # response
  # "a3:Sedan"=>
  # {"id"=>"Audi_A3",
  #  "name"=>"A3 Sedan",
  #  "submodel"=>"Sedan",
  #  "nicesubmodel"=>"sedan",
  #  "model"=>"A3",
  #  "nicemodel"=>"a3",
  #  "link"=>"/audi/a3",
  #  "years"=>{"NEW"=>[2017], "NEW_USED"=>[2016], "USED"=>[2015]}},

  # ummm these are actually submodels
  def models
    make = Make.find_by(edmund_id: params[:make_id])
    make_models = make.models.any? ? make.models : Model.get_models(make)
    @models = make_models
  end

  def years
    @model = Model.find(params[:model_id])
    @years = @model.years.split(", ")
  end

  def styles
    submodel = Model.find(params[:submodel])
    @year = params[:year]
    year_styles = submodel.styles.where(year: params[:year])
    @styles = year_styles.any? ? year_styles : Style.get_styles(submodel, params[:year])
  end

  def tesla_models
    @params = params
  end

  # in progress
  def tesla_trims
    @params = params
    @trims = Tesla.where(model: params[:tesla_model])
  end

  def tco
    # TODO forgot repairs column on tesla
    incentive = Incentive.find_by(state_code: params[:state_code]).amount
    tesla = Tesla.find(params[:tesla_trim])
    edmund = Edmund.new.used_tco(params[:style_id], params[:zipcode], params[:state_code])
    @columns = []
    @tesla_values = []
    @vehicle_values = []
    tesla.attributes.each do |column, value|
      #TODO need to add repairs
      costs = ["insurance", "maintenance", "taxes_and_fees", "financing", "depreciation", "fuel", "tax_credit"]
      next unless costs.include? column
      next unless value > BigDecimal("0")

      @columns.push(column)
      if column == "tax_credit"
        @tesla_values.push(incentive.to_i)
      else
        @tesla_values.push(value.to_i)
      end

      if column == "taxes_and_fees"
        @vehicle_values.push(edmund["taxandfees"]["total"].to_i)
      elsif column == "tax_credit"
        @vehicle_values.push(edmund["taxcredit"].to_i)
      else
        @vehicle_values.push(edmund[column]["total"].to_i)
      end
    end
    binding.pry
    # @tco = params
    # @tco = Edmund.new.used_tco(params[:style_id], params[:zipcode], params[:state_code])
  end
  # t.decimal :insurance, :precision => 8, :scale => 2, default: 0
  # t.decimal :maintenance, :precision => 8, :scale => 2, default: 0
  # t.decimal :taxes_and_fees, :precision => 8, :scale => 2, default: 0
  # t.decimal :financing, :precision => 8, :scale => 2, default: 0
  # t.decimal :depreciation, :precision => 8, :scale => 2, default: 0
  # t.decimal :fuel, :precision => 8, :scale => 2, default: 0
  # t.decimal :tax_credit, :precision => 8, :scale => 2, default: 0
  # t.decimal :total, :precision => 8, :scale => 2
  # private

  def load_makes
    @makes = Make.all
    @teslas = Tesla.pluck(:model).uniq
  end
end
