class CreatePromos < ActiveRecord::Migration[5.2]
  def change
    create_table :promos do |t|
      t.string :title
      t.string :type
      t.string :source
      t.string :link

      t.timestamps
    end
  end
end
