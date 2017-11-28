require 'sinatra'
require_relative 'app/user_validation'

use UserValidation

VALID_ITEM_ADDITION = /(.+)/

HELP_RESPONSE = 'Use `/gimme` to add an item to the weekly Gimme order. Example: `/gimme almonds`'.freeze

CONFIRM_ADD_ITEM = 'You\'re item has been added to the order'.freeze

INVALID_RESPONSE = 'I can\'t give you what you want as I don\'t understand. Try again like this: `/gimme almonds`'.freeze

post '/slack/command' do
  case params['text'].to_s.strip
  when 'help', '' then HELP_RESPONSE
  when VALID_ITEM_ADDITION then CONFIRM_ADD_ITEM
  else INVALID_RESPONSE
  end
end
