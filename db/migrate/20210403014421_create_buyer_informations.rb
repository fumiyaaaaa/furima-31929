class CreateBuyerInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_informations do |t|
      t.string     :postal_code,   null: false
      t.integer    :address_id,    null: false
      t.string     :municipality,  null: false
      t.string     :block_number,  null: false
      t.string     :building_name
      t.string     :tel,           null: false
      t.references :order_history, null: false, foreign_key: true
      t.timestamps
    end
  end
end
