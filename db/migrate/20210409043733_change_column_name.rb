class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :reports, :lessions, :lessons
  end
end
