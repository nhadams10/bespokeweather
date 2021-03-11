class CreateThresholds < ActiveRecord::Migration[6.0]
  def change
    create_table :thresholds do |t|
      t.integer :user_id
      t.integer :coldest
      t.integer :cold
      t.integer :moderate
      t.integer :warm
      t.integer :warmest

      t.timestamps
    end
  end
end
