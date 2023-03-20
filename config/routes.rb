Rails.application.routes.draw do
get("/users", { :controller => "users", :action => "index"})
get("/users/:name", { :controller => "users", :action => "user_details"})

get("/photos", { :controller => "photos", :action => "photo_index"})
get("/photos/:ph", { :controller => "photos", :action => "photo_details"})
get("delete_photo/:del_ph", { :controller => "photos", :action => "del_photo"})

get("/insert_photo", { :controller => "photos", :action => "insert_photo"})
end
