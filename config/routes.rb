Rails.application.routes.draw do

  get("/forex",{ :controller => "currencies", :action => "first_currency"})
  get("/forex/:currency",{ :controller => "currencies", :action => "second_currency"})
  get("/forex/:from/:to",{ :controller => "currencies", :action => "conversion"})

end
