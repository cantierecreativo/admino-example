class ContactsQuery < Admino::Query::Base
  starting_scope { Contact.all }
  ending_scope { |q| page(q.params[:page]).per(10) }

  search_field :matching_email
  search_field :matching_name

  filter_by :group,
            [:family, :work, :friends],
            include_empty_scope: true

  sorting :sort_by_name,
          :sort_by_email,
          :sort_by_group,
          default_scope: :sort_by_name
end

