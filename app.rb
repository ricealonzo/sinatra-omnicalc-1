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
get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @num = params.fetch("num").to_f
  @square_root =  Math.sqrt(@num) 
  erb(:square_root_results)
end
