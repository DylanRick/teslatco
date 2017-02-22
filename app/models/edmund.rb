class Edmund
  include HTTParty
  base_uri 'http://api.edmunds.com'
  default_params fmt: 'json', api_key: ENV['EDMUND_API_KEY']

  # http://api.edmunds.com/v1/api/tco/getmakeswithtcodata?api_key=xxx&fmt=json
  def tco_makes
    self.class.get('/v1/api/tco/getmakeswithtcodata?')
  end

  # https://api.edmunds.com/v1/api/tco/getmodelswithtcodata?makeid=200000001&fmt=json&api_key={api key}
  def tco_models(make_id)
    self.class.get('/v1/api/tco/getmodelswithtcodata?', { query: { makeid: make_id} })
  end

  # https://api.edmunds.com/v1/api/tco/getstyleswithtcodatabysubmodel?make=acura&model=zdx&year=2011&submodel=hatchback&fmt=json&api_key={api key}
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
  # {"styles" => {}}

  # https://api.edmunds.com/api/tco/v1/details/allnewtcobystyleidzipandstate/{style ID}/{zipcode}/{US State Code}?fmt=json&api_key={api key}
  def new_tco(style_id, zipcode, state_code)
    self.class.get("/api/tco/v1/details/allnewtcobystyleidzipandstate/#{style_id}/#{zipcode}/#{state_code}?")
  end

  # https://api.edmunds.com/api/tco/v1/details/allusedtcobystyleidzipandstate/{style ID}/{zipcode}/{US State Code}?fmt=json&api_key={api key}
  def used_tco(style_id, zipcode, state_code)
    self.class.get("/api/tco/v1/details/allusedtcobystyleidzipandstate/#{style_id}/#{zipcode}/#{state_code}?")
  end
  # {"insurance"=>{"values"=>[821.0, 846.0, 871.0, 897.0, 924.0], "total"=>4359.0},
  # "maintenance"=>{"values"=>[384.0, 1811.0, 816.0, 926.0, 1434.0], "total"=>5371.0},
  # "repairs"=>{"values"=>[306.0, 468.0, 502.0, 538.0, 577.0], "total"=>2391.0},
  # "taxandfees"=>{"values"=>[1127.0, 154.0, 154.0, 154.0, 154.0], "total"=>1743.0},
  # "financing"=>{"values"=>[689.0, 550.0, 404.0, 251.0, 90.0], "total"=>1984.0},
  # "depreciation"=>{"values"=>[3205.0, 1580.0, 1391.0, 1232.0, 1106.0], "total"=>8514.0},
  # "fuel"=>{"values"=>[1329.0, 1369.0, 1410.0, 1453.0, 1496.0], "total"=>7057.0},
  # "taxcredit"=>0.0}
end
