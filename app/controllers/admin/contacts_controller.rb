module Admin
  class ContactsController < BaseController
    respond_to :html

    include InflectionsConcern
    include RestConcern

    private

    def permitted_params
      params.
        require(:contact).
        permit(:first_name, :last_name, :email, :group)
    end

    def resource_class
      Contact
    end

    def query_class
      ContactsQuery
    end
  end
end

