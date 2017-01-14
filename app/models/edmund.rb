class Edmund
  include HTTParty
  base_uri 'http://api.edmunds.com/v1/api/tco'
  default_params fmt: 'json', api_key: ENV['EDMUND_API_KEY']

  # http://api.edmunds.com/v1/api/tco/getmakeswithtcodata?api_key=xxx&fmt=json
  def tco_makes
    self.class.get('/getmakeswithtcodata?')
  end
end
