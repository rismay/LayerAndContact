class ContactShare < ActiveRecord::Base
  validates :user_id, :contact_id, presence: true

  belongs_to :contact, class_name: "Contact", foreign_key: :contact_id
  belongs_to :user, class_name: "User", foreign_key: :user_id

end