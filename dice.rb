require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


get ("/") do
#  "<h1>On the Spot 'Dice Roll'</h1>
#  <p>
#  <ul>
#  <li><a href='/dice/2/6'> Roll Two dice with 6 sides eaach</a></li>
#  <li><a href='/dice/2/10'> Roll Two dice with 10 sides each</a></li>
#  <li><a href='/dice/5/4'> Roll Four dice with 5 sides each</a></li>
#  </ul>
#  </p>"

"<html>
<head>
  <title>On the Spot Dice Roll</title>
</head>
<style>
h1 {
  font-size: 36px;
  text-align: center;
  font-family: Arial, Helvetica, sans-serif;
}

ul {
  list-style-type: none;
  font-size: 20px;
  text-align: center;
  font-family: Arial, Helvetica, sans-serif;
  padding: 10;
  margin: 10;
}

li {
  #display: inline-block;
  padding: 20px;
}

a {
  color: blue;
  text-decoration: none;
}

footer {
  color: green;
  text-align: center;
}
</style>

<body>
  <header>
    <h1>On the Spot Dice Roll</h1>
  </header>
  <main>
    <ul>
      <li><a href='/dice/2/6'> Roll Two dice with 6 sides eaach</a></li>
      <li><a href='/dice/2/10'> Roll Two dice with 10 sides each</a></li>
      <li><a href='/dice/5/4'> Roll Four dice with 5 sides each</a></li>
    </ul>
  </main>
  <footer>
  </br></br>
    &copy; 2023 Carlo
  </footer>
</body>
</html>"


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
	
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  "<h1>2 Dies with 6 Sides</h1>
   <p>#{outcome}</p>
   </br></br><a href='/'>Back</a>"
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
