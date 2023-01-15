class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews, id: :uuid do |t|
      t.references :appointment, null: false, foreign_key: true, type: :uuid
      t.text :note
      t.integer :rating

      t.timestamps
    end
  end
end
