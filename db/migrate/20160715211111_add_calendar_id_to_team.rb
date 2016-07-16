class AddCalendarIdToTeam < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :calendar_id, :string
  end
end
