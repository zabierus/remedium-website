# == Schema Information
#
# Table name: galleries
#
#  id                    :bigint           not null, primary key
#  categorization        :boolean
#  code                  :string           not null
#  for_logged            :boolean
#  visible               :boolean          default(TRUE)
#  visible_from          :datetime
#  visible_to            :datetime
#  default_width         :integer
#  default_height        :integer
#  default_thumb_width   :integer
#  default_thumb_height  :integer
#  watermark_font_size   :integer
#  watermark_font_family :string
#  watermark_font_color  :string
#  watermark_text        :string
#  watermark_image       :string
#
require 'test_helper'

class GalleryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
