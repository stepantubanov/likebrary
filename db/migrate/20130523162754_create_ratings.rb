class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :value
      t.references :book
      t.references :user

      t.timestamps
    end

    add_index :ratings, [:book_id, :user_id], unique: true
  end
end
