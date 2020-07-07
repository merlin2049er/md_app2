class ChangeWatchlistToWatchlists < ActiveRecord::Migration[6.0]
  def change
    rename_table :watchlist, :watchlists
  end
end
