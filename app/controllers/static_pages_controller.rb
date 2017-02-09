class StaticPagesController < ApplicationController
  before_action :load_makes, only: [:index, :models]
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

  # in progress
  def tesla_trims
    @params = params
    @trims = Tesla.where(model: params[:tesla_model])
  end

  def tco
    
    # @tco = params
    # @tco = Edmund.new.used_tco(params[:style_id], params[:zipcode], params[:state_code])
  end
  # "utf8"=>"✓", "year"=>"2011", "style_id"=>"acura_nice_submodel_1_edmund_id_1", "zipcode"=>"e",
  # "state_code"=>"d", "tesla_model"=>"60", "tesla_trim"=>"6"

  private

  def load_makes
    @makes = Make.all
    @teslas = Tesla.pluck(:model).uniq
  end
end
