Rails.application.routes.draw do
  scope :cockpit, :path => '/cockpit' do
    constraints(:id => /[^\/]+/) do
      resources :hosts do
        member do
          get 'journal'
        end
      end
    end
  end
end
