require "sinatra"

get ("/") do
  "Carlo is Great"
end

get("/zebra") do
  "We must add a route for each path we want to support"
end
