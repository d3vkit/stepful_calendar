class CreateAvailabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :availabilities, id: :uuid do |t|
      t.references :calendar, null: false, foreign_key: true, type: :uuid
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false

      t.timestamps
    end
  end
end
