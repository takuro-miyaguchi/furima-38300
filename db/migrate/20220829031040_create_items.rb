class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :title         , null: false
      t.text       :concept       , null: false
      t.integer    :category_id   , null: false
      t.integer    :condition_id  , null: false
      t.integer    :charge_id     , null: false
      t.integer    :sender_id     , null: false
      t.integer    :period_id     , null: false
      t.integer    :price         , null: false
      t.references :user          , null: false
      t.timestamps
    end
  end
end
