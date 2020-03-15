class CreateJoinTableDealershipCar < ActiveRecord::Migration[6.0]
  def change
    create_join_table :dealerships, :cars do |t|
      # t.index [:dealership_id, :car_id]
      # t.index [:car_id, :dealership_id]
    end
  end
end
