class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :email, :string
      t.column :phone, :string
      t.column :address1, :string
      t.column :address2, :string
      t.column :city, :string
      t.column :state, :string
    end
  end

  def self.down
    drop_table :contacts
  end
end
