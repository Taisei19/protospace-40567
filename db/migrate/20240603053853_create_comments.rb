class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.timestamps

      t.references :user, foreign_key: true
      t.references :prototype, foreign_key: true

    end
  end
end
