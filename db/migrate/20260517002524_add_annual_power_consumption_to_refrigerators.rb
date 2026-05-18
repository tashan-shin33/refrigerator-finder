class AddAnnualPowerConsumptionToRefrigerators < ActiveRecord::Migration[8.1]
  def change
    add_column :refrigerators, :annual_power_consumption, :integer
  end
end
