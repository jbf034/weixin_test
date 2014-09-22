class CreatePublicAccounts < ActiveRecord::Migration
  def change
    create_table :public_accounts do |t|

      t.timestamps
    end
  end
end
