LiquidLaunch::Application.routes.draw do
  
  root :to => 'application#index'
  match 'results' => 'application#results'
  match ':plist_name' => 'application#results', :as => 'plist', :format => false, :plist_name => /[^\/]+/
  
end
