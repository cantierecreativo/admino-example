module PaginationConcern
  def collection
    if params[:format].nil?
      paginated_collection.tap do |collection|
        set_collection_ivar(collection)
      end
    else
      super
    end
  end

  def paginated_collection
    end_of_association_chain.page(params[:page])
  end
end

