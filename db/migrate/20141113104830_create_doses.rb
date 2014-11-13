class CreateDoses < ActiveRecord::Migration
  def change
    create_table :doses do |t|
      t.references :ingredient
      t.references :cocktail
      t.integer :amount

      t.timestamps
    end
  end
end
