class CreateJourneys < ActiveRecord::Migration
  def change
    create_table :journeys do |t|
      t.text :title
      t.references :user, index: true
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
