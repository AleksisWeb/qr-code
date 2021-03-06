class QrCodesController < ApplicationController
  before_action :fetch_qr_code, only: %i[edit update destroy]
  before_action :authorize, only: %i[index edit]

  def new; end

  def index
    @qr_codes = current_user.qr_codes.page(params[:page])
  end

  def edit; end

  def common_codes
    @qr_codes = QrCode.all.where(user_id:nil).page(params[:page])
    render :index
  end

  def create
      qr_code = QrCode.new
      qr_code.tracking = params[:tracking]
      qr_code.name = params[:name]
      qr_code.url = params[:url]
    if current_user     
      qr_code.user_id = current_user.id
      if qr_code.save
        redirect_to qr_codes_path, { notice: "#{current_user_name} QR код был создан" }
      else
        redirect_to root_path, { alert: "#{current_user_name} QR код не был создан" }
      end
    elsif params[:tracking] == '0'           
      if qr_code.save
        redirect_to common_codes_qr_codes_path, { notice: "#{current_user_name} QR код был создан" }
      else
        redirect_to root_path, { alert: "#{current_user_name} QR код не был создан" }
      end
    else
      authorize

    end
  end

  def update
    @qr_code.name = params[:name]
    if @qr_code.save
      redirect_to qr_codes_path, { notice: "#{current_user_name} QR код был изменен" }
    else
      redirect_to edit_qr_code_path, { alert: "#{current_user_name} QR код не был изменен" }
    end
  end

  def destroy
    @qr_code.destroy
    redirect_to qr_codes_path, { notice: " #{current_user_name} Qr код был удален" }
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
