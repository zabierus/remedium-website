# frozen_string_literal: true
class ArticleImageUploader < CarrierWave::Uploader::Base
    include CarrierWave::MiniMagick
  
    storage :postgresql_lo
  
    def store_dir
      "uploads/article_images/#{model.id}"
    end
  
    version :thumb do
      process resize_to_fill: [570, 380, gravity = "Center"]
    end
  
    version :large_thumb do
      process resize_to_fill: [810, 405, gravity = "Center"]
    end
  
    def extension_white_list
      %w(jpg jpeg gif png)
    end
  end
  