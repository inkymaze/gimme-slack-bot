require 'sinatra'
require_relative 'app/user_validation'

use UserValidation

VALID_ITEM_ADDITION = /^(@[\w\.\-_]+) (.+)/

HELP_RESPONSE = 'Use `/add` to add an item to the weekly order. Example: `/add almonds`'.freeze

CONFIRM_ADD_ITEM = 'You\'re item has been added to the order'.freeze

INVALID_RESPONSE = 'I can\'t give you what you want as I don\'t understand. Try again like this: `/add almonds`'.freeze

post '/slack/command' do
  case params['text'].to_s.strip
  when 'help', '' then HELP_RESPONSE
  when VALID_ITEM_ADDITION then CONFIRM_ADD_ITEM 
  else INVALID_RESPONSE
  end
end
