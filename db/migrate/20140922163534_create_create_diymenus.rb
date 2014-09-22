class CreateDiymenus < ActiveRecord::Migration
  def change
    create_table :create_diymenus do |t|
      t.integer :public_account_id
      t.integer :parent_id
      t.string :name
      t.string :key
      t.string :url
      t.boolean :is_show
      t.integer :sort

      t.timestamps
    end
	add_index :diymenus, :public_account_id
	add_index :diymenus, :parent_id
	add_index :diymenus, :key
  end
end
