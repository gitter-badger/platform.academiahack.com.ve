# == Schema Information
#
# Table name: videos
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  url                :string(255)
#  day_id             :integer
#  created_at         :datetime
#  updated_at         :datetime
#  video_file_name    :string(255)
#  video_content_type :string(255)
#  video_file_size    :integer
#  video_updated_at   :datetime
#

class Video < ActiveRecord::Base
  belongs_to :day

  has_attached_file :video,
                    :styles => {
                        :medium => { :geometry => "640x480", :format => 'flv' },
                        :thumb => { :geometry => "100x100#", :format => 'jpg', :time => 10 }
                    }, :processors => [:transcoder], :default_url => "missing.png"
  validates :video, :attachment_content_type =>{:content_type => [ 'application/x-mp4',
                                                                   'video/mpeg',
                                                                   'video/quicktime',
                                                                   'video/x-flv',
                                                                   'flv-application/octet-stream',
                                                                   'video/3gpp',
                                                                   'video/JPEG',
                                                                   'video/mp4',
                                                                   'git avideo/mpeg4',
                                                                   'video/mpeg4-generic',
                                                                   'video/H264',
                                                                   'video/raw' ]}

  # def video?
  #   [ 'application/x-mp4',
  #     'video/mpeg',
  #     'video/quicktime',
  #     'video/x-la-asf',
  #     'video/x-ms-asf',
  #     'video/x-msvideo',
  #     'video/x-sgi-movie',
  #     'video/x-flv',
  #     'flv-application/octet-stream',
  #     'video/3gpp',
  #     'video/3gpp2',
  #     'video/3gpp-tt',
  #     'video/BMPEG',
  #     'video/BT656',
  #     'video/CelB',
  #     'video/DV',
  #     'video/H261',
  #     'video/H263',
  #     'video/H263-1998',
  #     'video/H263-2000',
  #     'video/H264',
  #     'video/JPEG',
  #     'video/MJ2',
  #     'video/MP1S',
  #     'video/MP2P',
  #     'video/MP2T',
  #     'video/mp4',
  #     'video/MP4V-ES',
  #     'video/MPV',
  #     'video/mpeg4',
  #     'video/mpeg4-generic',
  #     'video/nv',
  #     'video/parityfec',
  #     'video/pointer',
  #     'video/raw',
  #     'video/rtx' ].include?(video.content_type)
  # end
end
