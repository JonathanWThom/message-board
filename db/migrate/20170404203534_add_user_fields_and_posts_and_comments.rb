class AddUserFieldsAndPostsAndComments < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :signature, :text

    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :user_id
    end

    create_table :comments do |t|
      t.text :body
      t.integer :post_id
      t.integer :user_id
    end
  end
end
