module Admin
  class ContactsController < BaseController
   inherit_resources
   actions :all, except: :show

   include PermittedParamsConcern
   include InflectionsConcern

    private

    def collection
      @contacts ||= query.scope(end_of_association_chain)
    end

    def query
      @query ||= ContactsQuery.new(params)
    end

    def permitted_params
      params.
        require(:contact).
        permit(:first_name, :last_name, :email, :group)
    end
  end
end

