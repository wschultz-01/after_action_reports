class ChangeColumnNameExpectations < ActiveRecord::Migration[5.2]
  def change
    rename_column :reports, :expections, :expectations
  end
end
