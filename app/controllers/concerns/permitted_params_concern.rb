module PermittedParamsConcern
  extend ActiveSupport::Concern

  def resource_params
    if %w(create update).include?(action_name)
      [ permitted_params ]
    end
  end
end

