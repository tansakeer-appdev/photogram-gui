Rails.application.routes.draw do
get("/users", { :controller => "users", :action => "index"})
get("/users/:name", { :controller => "users", :action => "user_details"})


end
