class QrCode < ApplicationRecord 
  after_create :generate_qr_code
  has_one_attached :image
  validates :url, presence: true
  validates :name, presence: true
  paginates_per 20
  belongs_to :user, optional: true 
  def generate_qr_code
    our_url =
      if self.tracking 
        Rails.application.routes.url_helpers.qr_code_url(self.id)
      else 
        self.url
      end    

  qrcode = RQRCode::QRCode.new(our_url)
   png = qrcode.as_png(
  bit_depth: 1,
  border_modules: 4,
  color_mode: ChunkyPNG::COLOR_GRAYSCALE,
  color: "black",
  file: nil,
  fill: "white",
  module_px_size: 6,
  resize_exactly_to: false,
  resize_gte_to: false,
  size: 120
)
path = Rails.root.join("tmp/cache/qr-code-#{self.id}.png")
 IO.binwrite(
 path,
  png.to_s
  )
 image.attach(
  io: File.open(path),
  filename: "qr-code-#{self.id}.png",
  content_type: 'image/png'
   )
  end
end

