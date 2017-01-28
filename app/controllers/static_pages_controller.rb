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

  # https://api.edmunds.com/api/vehicle/v2/honda/civic?state=used&fmt=json&api_key={api key}
  def styles
    submodel = Model.find(params[:submodel])
    @year = params[:year]
    year_styles = submodel.styles.where(year: params[:year])
    @styles = year_styles.any? ? year_styles : Style.get_styles(submodel, params[:year])
    #TODO Need to get errors if reaches out to database and doesnt find records!!!
  end

  def tco
    @tco = Edmund.new.used_tco(params[:style_id], params[:zipcode], params[:state_code])
  end

 #  {"insurance"=>{"values"=>[821.0, 846.0, 871.0, 897.0, 924.0], "total"=>4359.0},
 # "maintenance"=>{"values"=>[384.0, 1811.0, 816.0, 926.0, 1434.0], "total"=>5371.0},
 # "repairs"=>{"values"=>[306.0, 468.0, 502.0, 538.0, 577.0], "total"=>2391.0},
 # "taxandfees"=>{"values"=>[1127.0, 154.0, 154.0, 154.0, 154.0], "total"=>1743.0},
 # "financing"=>{"values"=>[689.0, 550.0, 404.0, 251.0, 90.0], "total"=>1984.0},
 # "depreciation"=>{"values"=>[3205.0, 1580.0, 1391.0, 1232.0, 1106.0], "total"=>8514.0},
 # "fuel"=>{"values"=>[1329.0, 1369.0, 1410.0, 1453.0, 1496.0], "total"=>7057.0},
 # "taxcredit"=>0.0}

  private

  def load_makes
    @makes = Make.all
  end
end
