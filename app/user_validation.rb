class UserValidation
  UNAUTHORIZED_MESSAGE = 'This app is not authorized. Check token configs.'.freeze
  UNAUTHORIZED_RESPONSE = ['200', {'Content-Type' => 'text'}, [UNAUTHORIZED_MESSAGE]]

  def initialize(app)
    @app = app
  end
  
  def call(env)
    req = Rack::Request.new(env)
    if req.params['token'] == ENV['SLACK_TOKEN']
      @app.call(env)
    else
      UNAUTHORIZED_RESPONSE
    end
  end
end
