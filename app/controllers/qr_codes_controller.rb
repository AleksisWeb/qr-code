class QrCodesController < ApplicationController
 before_action :fetch_qr_code, only: [:edit, :update ,:destroy]
 before_action :authorize, only: [:qr_code, :create]
  def new 
  end

  def qr_code
     @cod = QrCode.all
  end   
  def edit
  end
  def create
     qr_code = QrCode.new
     qr_code.name = params[:name]
     qr_code.url = params[:url]
     if qr_code.save
     redirect_to qr_codes_path, { notice: "Qr код был создан" }
     else 
       redirect_to root_path, { alert: "Qr код не был создан" }
     end 
  end
  def update
     @qr_code.name = params[:name]
     @qr_code.save
     redirect_to qr_codes_path, { notice: "Qr код был изменен" }
  end
  def destroy   
    @qr_code.destroy
    redirect_to qr_codes_path, { notice: "Qr код был удален" }
  end
  def show
    @qr_code = QrCode.find(params[:id])
    @qr_code.scans = @qr_code.scans + 1
    @qr_code.save 
    redirect_to @qr_code.url
  end
  

  private
  
  def fetch_qr_code
    @qr_code = QrCode.find_by(id: params[:id])  
  end
end