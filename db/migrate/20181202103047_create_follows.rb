class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.string :type
      t.integer :follower_id
      t.integer :followed_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
