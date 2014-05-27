class Contact < ActiveRecord::Base
  enum group: [ :family, :work, :friends ]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :group, presence: true
  validates :email, presence: true, email: true, uniqueness: true

  scope :matching_email, ->(text) {
    where('email ILIKE :text', text: "%#{text}%")
  }
  scope :matching_name, ->(text) {
    where(
      'first_name ILIKE :text OR last_name ILIKE :text',
      text: "%#{text}%"
    )
  }

  scope :family, ->{ where(group: Contact.groups[:family]) }
  scope :work, ->{ where(group: Contact.groups[:work]) }
  scope :friends, ->{ where(group: Contact.groups[:friends]) }

  scope :sort_by_name, ->(direction) do
    order("last_name #{direction}, first_name #{direction}")
  end
  scope :sort_by_email, ->(direction) { order(email: direction) }
  scope :sort_by_group, ->(direction) { order(group: direction) }
end

