require File.join(File.dirname(__FILE__), 'application')

set :run, false
set :environment, :production

use(Rack::Tracker) do
  handler :google_analytics, { tracker: 'UA-66841318-1' }
end

run Sinatra::Application
