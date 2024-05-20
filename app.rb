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
@square_root = Math.sqrt(@num)

  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  
  
  #The is the variable that contains the 
  #calculations for "r" in th payment equation!!input apr using erb tags!!.
  @apr = params.fetch("apr").to_i.to_f
  @intrest_rate_per_period =(params.fetch("apr").to_i.to_f/100)/12
  
  
  #this is the calculation for n(number of periods) in the equation
  @number_of_years = params.fetch("number_of_years").to_i.to_f
  @number_of_monthly_periods = @number_of_years * 12
  
  #this is the calculations for the numerator of the equation
  @principal = params.fetch("principal")
  @numerator = @intrest_rate_per_period.to_i.to_f * @principal.to_i.to_f
  
  #This is the calculations for the numerator.
  @denominator = 1 - (1 + @intrest_rate_per_period)** -@number_of_monthly_periods

  #this is the payment equation
  @payment = @numerator/@denominator

erb(:payment_results)
end


get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @min =  params.fetch("min").to_i
  @max = params.fetch("max").to_i
  @random_num = rand(@min..@max)
  erb(:random_results)
end
