class AddUserToPromos < ActiveRecord::Migration[5.2]
  def change
    add_column :promos, :user, :string
  end
end
