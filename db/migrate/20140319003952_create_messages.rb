class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :subject
      t.text :body
      t.references :user, index: true
      t.references :recipient, index: true

      t.timestamps
    end
  end
end
