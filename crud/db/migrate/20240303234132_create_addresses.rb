class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :zip_code, null: false
      t.string :public_place, null: false
      t.string :complement
      t.string :city, null: false
      t.string :uf, null: false
      t.string :ibge
      t.references :municipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
