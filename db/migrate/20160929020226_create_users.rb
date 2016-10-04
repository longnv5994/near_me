class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :provider
      t.string :uid
      t.string :image
      t.string :oauth_token
      t.boolean :signed_in
      t.string :authentication_token

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
