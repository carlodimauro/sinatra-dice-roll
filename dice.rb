require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


get ("/") do
  erb(:elephant)
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "<h1>this should be live</h1>"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  erb(:two_six)
end

get ("/dice/2/10") do
  first_ten_die = rand(1..10)
  second_ten_die = rand(1..10)
  sum_ten = first_ten_die + second_ten_die

  outcome_ten = "You rolled a #{first_ten_die} and a #{second_ten_die} for a total score of #{sum_ten}"

  "<h1>2 Dies with 10 Sides</h1>
  <p> #{outcome_ten}</p>
  </br></br><a href='/'>Back</a>"
end

get ("/dice/5/4") do
  die_f1 = rand(1..4)
  die_f2 = rand(1..4)
  die_f3 = rand(1..4)
  die_f4 = rand(1..4)
  die_f5 = rand(1..4)
  sum_f = die_f1 + die_f2 + die_f3 + die_f4 + die_f5
  
  outcome_f = "You rolled a #{die_f1} and a #{die_f2} and a #{die_f3} and a #{die_f4} and a #{die_f5} for a total score of #{sum_f}"
  #(simulate five 4-sided dice)

  "<h1>5 Dies with 4 Sides</h1>
  <p> #{outcome_f}</p>
  </br></br><a href='/'>Back</a>"
end
