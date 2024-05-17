require "sinatra"
require "sinatra/reloader"

get("/") do
erb(:homepage)
end
get("/square/results") do
  @num = params.fetch("num").to_f
  @square = @num * @num
  erb(:square_results)
end
get("/square/new") do
 
  erb(:homepage)
  
end
get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
