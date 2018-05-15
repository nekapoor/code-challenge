Rails.application.routes.draw do

	namespace :api, defaults: { format: "json" } do
		resources :comments, only: [:show, :create, :update] do
			member do
				post :mark_inactive
			end
		end
	end

end
