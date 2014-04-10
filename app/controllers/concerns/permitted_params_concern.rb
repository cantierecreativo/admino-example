module PermittedParamsConcern
  def resource_params
    if action_name == "create" || action_name == "update"
      [ permitted_params ]
    end
  end
end

