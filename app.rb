require 'sinatra'
require_relative 'app/user_validation'

use UserValidation

post '/slack/command' do
  "OK"
end
