class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true

  belongs_to :owner, class_name: "User", foreign_key: :user_id

  has_many :contact_shares
  has_many :shared_users, through: :contact_shares, source: :user

  def contacts_for_user_id(user_id)
    query = <<-SQL
    SELECT contacts.*
    FROM contacts
    LEFT OUTER JOIN contact_shares ON contacts.user_id = contact_shares.user_id
    WHERE contact_shares.user_id = ? OR contacts.user_id = ?
    SQL

    users = Contact.find_by_sql([query, user_id, user_id])
  end

end