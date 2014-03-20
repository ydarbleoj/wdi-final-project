class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :sender, index: true
      t.references :recipient, index: true
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
