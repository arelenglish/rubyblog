class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.string :twitter_handle
      t.string :email

      t.timestamps
    end
  end
end
