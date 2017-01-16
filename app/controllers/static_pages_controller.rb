class StaticPagesController < ApplicationController
  before_action :start_edmund

  attr_accessor :edmund

  def index
    # makes = JSON.parse(edmund.tco_makes.body)["makes"]
    makes_json = JSON.parse(File.read("db/makes.json"))["makes"]
    makes = {}
    options = []
    makes_json.each do |make|
      makes[make[0]] = make[1]
      options << [ make[1]["name"], make[1]["id"] ]
    end
    @make_options = options
  end
  # @test = JSON.parse(edmund.tco_models('200000001').body)["models"]

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
  def models
    models = JSON.parse(edmund.tco_models(params[:make_id]).body)["makes"]
    options = []

    model.each do |model|
      nil
    end
    @model_options = nil
  end

  # https://api.edmunds.com/api/vehicle/v2/honda/civic?state=used&fmt=json&api_key={api key}
  def styles
  end

  private

  def start_edmund
    @edmund = Edmund.new
  end
end
