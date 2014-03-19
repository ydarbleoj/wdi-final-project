class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :video
      t.string :photo
      t.text :text
      t.text :caption
      t.references :journey, index: true
      t.text :title

      t.timestamps
    end
  end
end
