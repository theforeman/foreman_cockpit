Rails.application.routes.draw do
  scope :cockpit, :path => '/cockpit' do
    constraints(:id => /[^\/]+/) do
      resources :hosts, :only => [] do
        member do
          ForemanCockpit::COCKPIT_ACTIONS.each do |action|
            get action
          end
        end
      end
    end
  end
end
