class AddSuspensionToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :is_suspended, :boolean
  end
end
