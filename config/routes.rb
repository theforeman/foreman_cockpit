Rails.application.routes.draw do
  scope :cockpit, :path => '/cockpit' do
    constraints(:id => /[^\/]+/) do
      resources :hosts, :only => [] do
        member do
          get :cockpit_console
          get :journal
          get :storage
        end
      end
    end
  end
end
