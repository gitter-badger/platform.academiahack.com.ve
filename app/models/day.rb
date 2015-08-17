# == Schema Information
#
# Table name: days
#
#  id                 :integer          not null, primary key
#  number             :integer
#  name               :string(255)
#  week_id            :integer
#  created_at         :datetime
#  updated_at         :datetime
#  status             :integer
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  required_knowledge :text
#  cheatsheet         :text
#

class Day < ActiveRecord::Base
  belongs_to :week
  has_many :challenges
  has_many :videos
  enum status: [ :blocked, :active, :done ]

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "0.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def order_list
    count = self.class.count

    if self.active?
      day_number = self.number

      if day_number == 1
        days = complete(day_number, 2, 'top')
      elsif day_number == 2
        days = complete(day_number, 1, 'top')
      elsif day_number == count - 1
        days = complete(day_number, 1, 'bottom')
      elsif day_number == count
        days = complete(day_number, 2, 'bottom')
      else
        days = complete day_number
      end
    end
    days
  end

  def complete(day_number, repeat = 0, position = 'none')
    day_min = day_number - 2
    day_max = day_number + 2

    days = self.class.where('number >= ? AND number <= ?', day_min, day_max).order(:number)
    add(days, repeat, position)
  end

  def add(days, repeat, position)
    repeat.times do
      aux_day = Day.new
      aux_day.number = -1
      aux_day.status = nil
      if position == 'top'
        days.unshift aux_day
      elsif position == 'bottom'
        days.push aux_day
      end
    end
    days
  end

  def get_classroom_challenges
    self.challenges.where('time = ?', 'classroom')
  end

  def get_homework_challenges
    self.challenges.where('time = ?', 'homework')
  end

  def transform_content
    transform_required_knowledge
    transform_cheatsheet
    self
  end

  def transform_required_knowledge
    if self.required_knowledge
      self.required_knowledge = Kramdown::Document.new(self.required_knowledge, {input: 'GFM',syntax_highlighter: 'rouge'}).to_html
    end
    self
  end

  def transform_cheatsheet
    if self.cheatsheet
      self.cheatsheet = Kramdown::Document.new(self.cheatsheet, {syntax_highlighter: 'rouge'}).to_html
    end
    self
  end

end
