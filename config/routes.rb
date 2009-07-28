ActionController::Routing::Routes.draw do |map|
  map.resources :tickets

  map.resources :mailfetches

  map.resources :categories

  map.resources :todolists

  map.resources :milestones

  map.resources :users_projs

  map.resources :comments
  
  map.resources :categories
  
  map.resources :todolists do |todolist|
    todolist.resources :todos do |todo|
      todo.resources :completes
    end
  end
  map.resources :projs do |proj|
    proj.resources :todolists 
    proj.resources :messages
    proj.resources :milestones
    proj.resources :tickets
    proj.resources :categories do |category|
      category.resources :messages
    end
  end

  map.resources :activations

  map.resources :attachments

  map.resources :messages

  map.resources :todos

  map.resources :departments


  map.resources :users do |user|
    user.resources :projs 
    user.resources :todolists do |todolist|
      todolist.resources :todos 
      
    end
    user.resources :users_projs
  end
  
  
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.root :controller => "users" ,:action => "index"
  map.connect 'create_admin', :controller => "users", :action => "create_admin"
  map.connect 'invalid_activation', :controller => "activations" ,:action => "invalid_activation"
  map.connect 'todo_list', :controller => "users" ,:action => "todo_list"
  map.connect 'alltickets', :controller => "users" ,:action => "tickets"
  map.connect 'allmilestones', :controller => "users" ,:action => "milestones"
  map.connect 'logout', :controller => "users" ,:action => "logout"
  map.connect 'install', :controller => "users" ,:action => "install"
  map.connect 'complete/:id/todo',  :controller => "todos" ,:action => "complete"
  map.connect 'incomplete/:id/todo',  :controller => "todos" ,:action => "incomplete"
  map.connect 'complete/:id/milestone',  :controller => "milestones" ,:action => "complete"
  map.connect 'incomplete/:id/milestone',  :controller => "milestones" ,:action => "incomplete"
  map.connect 'proj_todo_list', :controller => "proj" ,:action => "todo_list"
  map.connect 'proj_messages_list', :controller => "proj" ,:action => "messages_list"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
