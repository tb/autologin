Rails.application.routes.draw do |map|
  match 'autologin/:code', :controller => :autologin, :action => :login
end