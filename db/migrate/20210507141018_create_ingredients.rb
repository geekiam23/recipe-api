class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :aisle
      t.string :consistency
      t.string :name
      t.string :nameClean
      t.string :original
      t.string :originalString
      t.string :originalClean
      t.integer :amount
      t.string :unit
      t.text :meta, array: true, default: []
      t.text :metaInformation, array: true, default: []

      t.timestamps
    end
  end
end
