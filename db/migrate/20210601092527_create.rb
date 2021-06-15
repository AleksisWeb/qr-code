class Create < ActiveRecord::Migration[6.1]
  def change
    create_table :qr_codes do |t|
      t.string "name"
      t.text "url"
      t.integer "scans", default: 0
      t.timestamps
    end  
  end
end
