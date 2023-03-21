Rails.application.routes.draw do
get("/", { :controller => "users", :action => "index"})
get("/users", { :controller => "users", :action => "index"})
get("/users/:name", { :controller => "users", :action => "user_details"})
get("/insert_user", { :controller => "users", :action => "insert_user"})
get("/update_user/:the_user_id", { :controller => "users", :action => "update_user"})

get("/photos", { :controller => "photos", :action => "photo_index"})
get("/photos/:ph", { :controller => "photos", :action => "photo_details"})
get("delete_photo/:del_ph", { :controller => "photos", :action => "del_photo"})
get("/insert_photo", { :controller => "photos", :action => "insert_photo"})
get("/update_photo/:phoid", { :controller => "photos", :action => "update_photo"})

get("/add_comment/:photo_id", { :controller => "photos", :action => "add_comment"})



end
