class ContactsController < ApplicationController
 inherit_resources
 actions :all, except: :show
 include PermittedParamsConcern

  private

  def collection
    @query ||= ContactsQuery.new(params)
    @query.scope
  end

  def permitted_params
    params.
      require(:contact).
      permit(:first_name, :last_name, :email, :group)
  end
end
