class Edmund
  include HTTParty
  base_uri 'http://api.edmunds.com'
  default_params fmt: 'json', api_key: ENV['EDMUND_API_KEY']

  # http://api.edmunds.com/v1/api/tco/getmakeswithtcodata?api_key=xxx&fmt=json
  def tco_makes
    self.class.get('/v1/api/tco/getmakeswithtcodata?')
  end

  # https://api.edmunds.com/v1/api/tco/getmodelswithtcodata?makeid=200000001&
  # fmt=json&api_key={api key}
  def tco_models(make_id)
    self.class.get('/v1/api/tco/getmodelswithtcodata?', { query: { makeid: make_id} })
  end

  # https://api.edmunds.com/v1/api/tco/getstyleswithtcodatabysubmodel?make=
  # acura&model=zdx&year=2011&submodel=hatchback&fmt=json&api_key={api key}
  def tco_styles(submodel_id, year)
    # can get submodel and model from submodel
    # need make name
    # need year
    submodel = Model.find(submodel_id)
    model = submodel.name
  end
  # https://api.edmunds.com/api/vehicle/v2/honda/civic?state=used&fmt=json&api_key={api key}
  # def tco_styles(make_id, model)
  #   self.class.get("/api/vehicle/v2/#{make_id.downcase}/civic?")
  # end
end
