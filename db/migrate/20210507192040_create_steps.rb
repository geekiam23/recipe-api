class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.string :description
      t.integer :number
      t.references :ingredient, null: false, foreign_key: true
      t.references :equipment, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
