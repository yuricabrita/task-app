class GiveDefaultValueToCompleteInTasks < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :complete, :boolean, :default => false
  end
end
