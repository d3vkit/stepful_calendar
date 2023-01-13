class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name, required: true
      t.string :type, required: true

      t.timestamps
    end
  end
end
