module InflectionsConcern
  extend ActiveSupport::Concern

  included do
    helper_method :resource_class_name_inflections
  end

  def resource_class_name_inflections
    {
      singular: resource_class.model_name.human(count: 1),
      plural: resource_class.model_name.human(count: 2)
    }
  end
end

