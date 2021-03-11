class CreateRecommendations < ActiveRecord::Migration[6.0]
  def change
    create_table :recommendations do |t|
      t.integer :user_id
      t.integer :clothes_id
      t.integer :upper_bound
      t.integer :lower_bound

      t.timestamps
    end
  end
end
