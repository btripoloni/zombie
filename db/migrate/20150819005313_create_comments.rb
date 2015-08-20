class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.text :comment
      t.boolean :show_email, default: false

      t.timestamps null: false
    end
  end
end
