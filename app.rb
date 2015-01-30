require("bundler/setup")
require("pry")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @venues = Venue.all
  erb(:index)
end

post('/venues') do
  venue = params.fetch("venue")
end
