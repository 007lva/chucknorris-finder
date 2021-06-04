class BringResultsFromApi
  include HTTParty

  base_uri 'https://api.chucknorris.io'
  headers 'Content-Type' => 'application/json'
  # INFO: uncomment this line if you need to debug api calls
  # logger ActiveSupport::Logger.new('log/api-calls.log'), :debug, :curl

  def call(query)
    # TODO: handle exceptions
    self.class.get("/jokes/search?query=#{query}")
  end
end
