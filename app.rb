require 'sinatra'
require_relative 'app/user_validation'

user UserValidation

post '/slack/command' do
  "OK"
end
