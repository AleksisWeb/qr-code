class AddUserIdToQrCodes < ActiveRecord::Migration[6.1]
  def change
    add_column :qr_codes, :user_id, :bigint
  end
end
