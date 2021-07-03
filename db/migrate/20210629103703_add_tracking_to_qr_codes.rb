class AddTrackingToQrCodes < ActiveRecord::Migration[6.1]
  def change
    add_column :qr_codes, :tracking, :boolean
  end
end
