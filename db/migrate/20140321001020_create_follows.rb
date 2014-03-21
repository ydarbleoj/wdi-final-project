class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :follower, index: true
      t.references :followed, index: true

      t.timestamps
    end
    # enforce uniqueness of pairs so that a user can't be
    # followed more than once by the same person
    add_index :follows, [:follower_id, :followed_id], unique: true
  end
end
