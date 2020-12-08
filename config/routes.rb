Rails.application.routes.draw do
  
  get 'konfirmasi_display/index'

  resources :lucky_draws do
    get "new/:template_id", to: "lucky_draws#new", on: :collection
  end
  get "lucky_draws/spin_time"
  
  resources :registrations
  get 'warranty/:serial' => 'warranties#warranty'
  get 'terms' => 'warranties#terms'
  # defaults to dashboard
  root :to => 'warranties#warranty'
  
  get 'lucky_draws/lucky_draw'
  post 'lucky_draws/lucky_draw'
  post 'lucky_draws/import_voucher'
  
  get 'pages/registered'
  get 'pages/error500'

  # api routes
  get '/api/documentation' => 'api#documentation'
  get '/api/datatable' => 'api#datatable'
  get '/api/jqgrid' => 'api#jqgrid'
  get '/api/jqgridtree' => 'api#jqgridtree'
  get '/api/i18n/:locale' => 'api#i18n'
  post '/api/xeditable' => 'api#xeditable'
  get '/api/xeditable-groups' => 'api#xeditablegroups'

  # the rest goes to root
  get '*path' => redirect('/')
end
