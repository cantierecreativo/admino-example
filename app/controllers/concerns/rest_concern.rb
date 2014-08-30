module RestConcern
  extend ActiveSupport::Concern

  include UrlsConcern

  included do
    helper_method :resource_class
    helper_method :query_class
  end

  def index
    @query = query_class.new(params)
    @collection = @query.scope
    respond_with :admin, @collection
  end

  def new
    @resource = resource_class.new
    respond_with :admin, @resource
  end

  def create
    @resource = resource_class.new(permitted_params)
    @resource.save
    respond_with :admin, @resource
  end

  def edit
    @resource = resource_class.find(params[:id])
    respond_with :admin, @resource
  end

  def update
    @resource = resource_class.find(params[:id])
    @resource.update_attributes(permitted_params)
    respond_with :admin, @resource
  end

  def destroy
    @resource = resource_class.find(params[:id])
    @resource.destroy
    respond_with :admin, @resource
  end

  private

  def resource_class
    throw 'Implement me!'
  end

  def query_class
    throw 'Implement me!'
  end
end

