class CreateComment < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :doctor, foreign_key: true
      t.references :author, foreign_key: true
      t.text :comment_body
      t.integer :rating
      t.boolean :active, :default => true
    end
  end
end
