Rails.application.routes.draw do
  get("/", { :controller => "pages", :action => "home" })

  get("/weather/check", { :controller => "forecasts", :action => "display_form_to_user" })

  get("/weather/display", { :controller => "forecasts", :action => "location" })
end
