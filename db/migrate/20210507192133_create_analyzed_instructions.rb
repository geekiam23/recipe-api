class CreateAnalyzedInstructions < ActiveRecord::Migration[6.0]
  def change
    create_table :analyzed_instructions do |t|
      t.references :step, null: true, foreign_key: true
      
      t.timestamps
    end
  end
end
