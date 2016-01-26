require 'bundler/setup'

require 'sinatra/base'
require 'json'

module GHReleaseWebhook
  class Webhook < Sinatra::Base
    post '/payload' do
      json = JSON.parse request.body.read
      return unless json["action"] == "published"
      puts "Tag \"#{json['release']['tag_name']}\" was released"
    end
  end
end
