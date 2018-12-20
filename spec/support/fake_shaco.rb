require 'sinatra/base'

class FakeShaco < Sinatra::Base
  get '/api/v1/works' do
    json_response 200, 'works.json'
  end

  get '/api/v1/works/:id' do
    json_response 200, 'work.json'
  end

  patch '/api/v1/works/:id' do
    json_response 200, 'work.json'
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
