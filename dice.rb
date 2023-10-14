require "sinatra"
require "sinatra/reloader"

get ("/") do
  "Carlo is Great"
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "<h1>this should be live</h1>"
end
