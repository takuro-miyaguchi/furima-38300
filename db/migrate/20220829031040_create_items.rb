class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer    :category_id   , null: false
      t.integer    :condition_id  , null: false
      t.integer    :charge_id     , null: false
      t.integer    :sender_id     , null: false
      t.integer    :period_id     , null: false
      t.timestamps
    end
  end
end
