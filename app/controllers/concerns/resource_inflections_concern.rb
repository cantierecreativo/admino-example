module ResourceInflectionsConcern
  extend ActiveSupport::Concern

  included do
    helper_method :inflections
  end

  private

  def inflections
    {
      singular: resource_class.model_name.human(count: 1),
      plural: resource_class.model_name.human(count: 2)
    }
  end
end

