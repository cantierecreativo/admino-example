module ResourceUrlsConcern
  extend ActiveSupport::Concern

  included do
    helper_method :edit_resource_url,
      :resource_url,
      :new_resource_url,
      :collection_url
  end

  private

  def edit_resource_url(resource)
    url_for(controller: controller_path, action: :edit, id: resource)
  end

  def resource_url(resource)
    url_for(controller: controller_path, action: :show, id: resource)
  end

  def new_resource_url
    url_for(controller: controller_path, action: :new)
  end

  def collection_url
    url_for(controller: controller_path, action: :index)
  end
end

