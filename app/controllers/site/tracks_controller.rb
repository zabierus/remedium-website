class Site::TracksController < SiteController
  def download_track
    @track = Track.find_by(:id => params[:id]).audio_file
    send_file(@track.path, disposition: "attachment", x_sendfile: true)
  end
end
