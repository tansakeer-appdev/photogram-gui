Rails.application.routes.draw do
get("/users", { :controller => "users", :action => "index"})
get("/users/:name", { :controller => "users", :action => "user_details"})

get("/photos", { :controller => "photos", :action => "photo_index"})
get("/photos/:ph", { :controller => "photos", :action => "photo_details"})

end
