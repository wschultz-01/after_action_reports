class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :expections
      t.string :actual_events
      t.string :lessions
      t.string :next_time
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
