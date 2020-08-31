# == Schema Information
#
# Table name: tracks
#
#  id           :bigint           not null, primary key
#  album_id     :integer
#  artist       :string
#  title        :string
#  lyrics       :text
#  url          :string
#  release_date :datetime
#  audio_file   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
