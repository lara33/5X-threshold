class CreateTagTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_tasks do |t|
      t.integer :task_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
