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

  # TODO figure out what to do when quote is met on API key
  def tco_styles(make, model, year, submodel)
    self.class.get(
      '/v1/api/tco/getstyleswithtcodatabysubmodel?',
      {
        query: {
          make: make,
          model: model,
          year: year,
          submodel: submodel
        }
      }
    )
  end

  # https://api.edmunds.com/v1/api/tco/newtruecosttoownbystyleidandzip/{style ID}/{zipcode}?fmt=json&api_key={api key}
  def new_tco(style_id, zipcode)
    self.class.get("/v1/api/tco/newtruecosttoownbystyleidandzip/#{style_id}/#{zipcode}?")
  end

  # https://api.edmunds.com/v1/api/tco/usedtruecosttoownbystyleidandzip/101426944/90019?fmt=json&api_key={api key}
  def used_tco(style_id, zipcode)
    self.class("/v1/api/tco/usedtruecosttoownbystyleidandzip/#{style_id}/#{zipcode}?")
  end
end
