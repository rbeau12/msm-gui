Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  post("/directors", { :controller => "directors", :action => "create" })
  post("/modify_director/:path_id",{ :controller => "directors", :action => "edit" })
  get("/delete_director/:path_id", { :controller => "directors", :action => "delete"})


  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  post("/movies", { :controller => "movies", :action => "create" })
  post("/modify_movie/:path_id",{ :controller => "movies", :action => "edit" })
  get("/delete_movie/:path_id", { :controller => "movies", :action => "delete"})


  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  post("/actors", { :controller => "actors", :action => "create" })
  post("/modify_actor/:path_id",{ :controller => "actors", :action => "edit" })
  get("/delete_actor/:path_id", { :controller => "actors", :action => "delete"})

end
