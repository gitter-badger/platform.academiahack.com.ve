class Day < ActiveRecord::Base
  belongs_to :week
  has_many :challenges
  enum status: [ :blocked, :active, :done ]

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "0.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def get_classroom_challenges
    self.challenges.where('time = ?', 'classroom')
  end

  def get_homework_challenges
    self.challenges.where('time = ?', 'homework')
  end


end
