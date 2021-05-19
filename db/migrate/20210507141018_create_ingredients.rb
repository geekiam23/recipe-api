class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :aisle
      t.string :consistency
      t.string :name
      t.string :name_clean
      t.string :original
      t.string :original_string
      t.string :original_clean
      t.integer :amount
      t.string :unit
      t.text :meta, array: true, default: []
      t.text :meta_information, array: true, default: []

      t.timestamps
    end
  end
end
