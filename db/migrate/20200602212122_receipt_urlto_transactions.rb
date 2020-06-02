class ReceiptUrltoTransactions < ActiveRecord::Migration[6.0]
  def change

    add_column  :transactions,   :reciept_url, :string
  end
end
