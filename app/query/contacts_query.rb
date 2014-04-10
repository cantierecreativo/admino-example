class ContactsQuery < Admino::Query::Base
  starting_scope { Contact.all }
  ending_scope { |q| page(q.params[:page]).per(10) }

  search_field :matching_email
  filter_by :group, [:of_family, :of_work, :of_friends], include_empty_scope: true

  sorting :by_first_name, :by_last_name, :by_email, :by_group
end
