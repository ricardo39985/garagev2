class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :model
      t.integer :year
      t.string :standard_specs
      t.string :car_options
      t.string :transmission

      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :manufacturer, null: false, foreign_key: true
      t.timestamps
    end
  end
end
