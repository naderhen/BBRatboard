# config/initializers/pdfkit.rb
PDFKit.configure do |config|
  config.wkhtmltopdf = Rails.root.join('vendor', 'wkhtmltopdf-amd64').to_s
  config.default_options = {
    :page_size => 'Legal',
    :print_media_type => true
  }
end