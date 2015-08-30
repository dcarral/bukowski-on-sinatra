require "rubygems"
require "bundler/setup"
require "sinatra"
require "rack/tracker"
require File.join(File.dirname(__FILE__), "environment")

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
  set :show_exceptions, :after_handler
end

configure :production, :development do
  enable :logging
end

helpers do
  # add your helpers here
end

get "/" do
  track("google_analytics", { "class_name" => "Send", "category" => "Visits", "action" => "Hit" })

  @profiles = Profile.all
  erb :root
end

def track(tool_name, event_params = {})
  default_params = { "label" => "Standard", "value" => 1 }

  request.env["tracker"] = {
    "google_analytics" => [ default_params.merge(event_params) ]
  }
end
