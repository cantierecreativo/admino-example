module Admin
  class ContactsController < BaseController
    include ResourceRestActionsConcern

    private

    def permitted_params
      params.
        require(:contact).
        permit(:first_name, :last_name, :email, :group)
    end
  end
end

