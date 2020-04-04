class AddTrackableAndUidToDevise < ActiveRecord::Migration[6.0]
  def change

    ## Trackable
    add_column  :users,  :sign_in_count, :string, default: 0, null: false
    add_column  :users,   :current_sign_in_at, :datetime
    add_column  :users,   :last_sign_in_at, :datetime
    add_column  :users,   :current_sign_in_ip, :string
    add_column  :users,   :last_sign_in_ip, :string

     # uid for facebook oath
     add_column  :users,  :uid, :string

  end
end
