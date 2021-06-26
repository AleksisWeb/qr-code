namespace :qr_codes do
  task delete_invalid_records: :environment do
   qr_codes = QrCode.where(name: ' ')
    if qr_codes.count > 0
     qr_codes.destroy_all
     puts "Все записи удалены"
    else 
     puts "Нечего удалять"
    end 
  end
end  