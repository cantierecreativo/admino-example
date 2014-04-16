module Contacts
  class IndexPage < Page
    set_url '/admin/contacts/'

    sections :contacts, 'table > tr' do
      action :destroy
    end
  end
end

