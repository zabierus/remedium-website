# frozen_string_literal: true
class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :postgresql_lo

  def store_dir
    "uploads/users_avatars/#{model.id}"
  end

  process resize_to_fill: [200, 200, gravity = "Center"]

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
