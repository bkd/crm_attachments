Rails.application.routes.draw do |map|
  scope (!Setting.table_exists? || Setting.base_url.blank?) ? "/" : Setting.base_url do  
    resources :attached_files do
      collection do
        get   :upload
      end

      member do
        get   :download
      end
    end
  end
end