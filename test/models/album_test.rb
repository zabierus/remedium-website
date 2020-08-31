# == Schema Information
#
# Table name: albums
#
#  id           :bigint           not null, primary key
#  track_id     :integer          not null
#  title        :string
#  cover        :string
#  release_date :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
