module ResourceRestActionsConcern
  extend ActiveSupport::Concern

  include ResourceUrlsConcern
  include ResourceInflectionsConcern

  included do
    respond_to :html

    helper_method :resource_class
    helper_method :query_class
  end

  def index
    @query = query_class.new(params)
    @collection = @query.scope(starting_scope)
    respond_with @collection
  end

  def new
    @resource = resource_class.new
    respond_with @resource
  end

  def create
    @resource = resource_class.new(permitted_params)
    @resource.save
    respond_with @resource, location: collection_url
  end

  def edit
    @resource = resource_class.find(params[:id])
    respond_with @resource
  end

  def update
    @resource = resource_class.find(params[:id])
    @resource.update_attributes(permitted_params)
    respond_with @resource, location: collection_url
  end

  def destroy
    @resource = resource_class.find(params[:id])
    @resource.destroy
    respond_with @resource, location: collection_url
  end

  protected

  def resource_class
    controller_name.classify.constantize
  end

  def query_class
    "#{controller_name.classify.pluralize}Query".constantize
  end
  
  def starting_scope
  end
end

