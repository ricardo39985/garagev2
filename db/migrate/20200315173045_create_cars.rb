class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :manufacturer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
