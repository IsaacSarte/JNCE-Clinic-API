class RemoveMessagetoLogs < ActiveRecord::Migration[6.1]
  def change
    remove_column :logs, :message, :text
  end
end
