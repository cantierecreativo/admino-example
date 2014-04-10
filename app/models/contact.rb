class Contact < ActiveRecord::Base
  enum group: [ :family, :work, :friends ]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, email: true, uniqueness: true

  scope :matching_email, -> (email) { where('email ILIKE ?', "%#{email}%") }
  scope :of_family, -> { where(group: Contact.groups[:family]) }
  scope :of_work, -> { where(group: Contact.groups[:work]) }
  scope :of_friends, -> { where(group: Contact.groups[:friends]) }

  scope :by_first_name, ->(direction) { order(first_name: direction) }
  scope :by_last_name, ->(direction) { order(last_name: direction) }
  scope :by_email, ->(direction) { order(email: direction) }
  scope :by_group, ->(direction) { order(group: direction) }
end
