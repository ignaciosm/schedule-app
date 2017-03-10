class AddPasswordDigestAndOrganizerToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :password_digest, :string
    add_column :organizations, :organizer, :string
  end
end
