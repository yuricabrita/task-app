class TasksReferencesList < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :list, index:true
  end
end
