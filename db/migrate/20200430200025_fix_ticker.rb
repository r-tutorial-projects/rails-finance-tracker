class FixTicker < ActiveRecord::Migration[6.0]
  def change
    rename_column :stocks, :ticket, :ticker
  end
end
