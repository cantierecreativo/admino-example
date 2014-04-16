module Contacts
  class NewPage < Page
    set_url '/admin/contacts/new'

    fields :first_name, :last_name, :email, :group
    submit_button

    submission :save
  end
end

