require "sinatra"
require "sinatra/reloader"
require "bigdecimal" # Added for precise calculations
require "bigdecimal/util" # Added for converting to BigDecimal

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
  @apr = params.fetch("apr").to_f
  @number_of_years = params.fetch("number_of_years").to_i
  @principal = params.fetch("principal").to_f

  # Convert APR to monthly interest rate
  @interest_rate_per_period = @apr / 100 / 12
  # Total number of monthly payments
  @number_of_monthly_periods = @number_of_years * 12

  # Calculate monthly payment using the formula
  # if @interest_rate_per_period == 0
  #   @payment = @principal / @number_of_monthly_periods
  # else
    @payment =(@principal * @interest_rate_per_period / (1 - (1 + @interest_rate_per_period)**-@number_of_monthly_periods)).to_fs(:currency)
  # end

  erb(:payment_results)
end

get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @min_num = params.fetch("min").to_i
  @max_num = params.fetch("max").to_i
  @random_num = rand(@min..@max)
  erb(:random_results)
end
