require("bundler/setup")
require("pry")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @venues = Venue.all
  erb(:index)
end

post('/venues') do
  @venues = Venue.all
  venue_name = params.fetch("venue")
  venue = Venue.create(:name => venue_name)
  erb(:index)
end

get('/venues/:id') do
  @venue = Venue.find(params.fetch("id").to_i)
  @bands = Band.all
  erb(:add_bands)
end

post('/bands') do
  @venue = Venue.all
  @bands = Band.all
  band_name = params.fetch("band")
  band = Band.create({:name => band_name})
  erb(:add_bands)
end

get('/bands/:id') do
  @venues = Venue.all
  @bands = Band.all
  @band = Band.find(params.fetch("id").to_i)
  erb(:edit_bands)
end

patch('/band/:id/edit') do
  @band = Band.find(params.fetch("id").to_i)
  name = params.fetch("name")
  @band.update({name: name})
  redirect('/')
end

delete('/band/:id/delete') do
  @band = Band.find(params.fetch("id").to_i)
  @band.destroy
  redirect('/')
end

post('/which_venue') do
  @venues = Venue.all
  venue_ids = params.fetch("venue_ids")
  new_array = []
  venue_ids.each() do |id|
    new_array.push(id.to_i())
  end
  band = Band.create({:venue_ids => new_array})
  redirect('/')
end
