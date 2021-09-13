class ImagesUploader < CarrierWave::Uploader::Base
  storage :file
  def store_dir
    'uploads'
  end
  def content_type_allowlist
    /image\//
  end
end
