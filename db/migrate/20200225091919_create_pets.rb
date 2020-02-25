class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.float :price_in_eur
      t.text :description
      t.string :type
      t.string :breed

      t.timestamps
    end
  end
end
