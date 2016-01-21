# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  name_space_id          :string(255)
#  last_name              :string(255)
#  identity               :string(255)
#  gitlab_user_id         :string(255)
#

class User < ActiveRecord::Base
  has_many :comments
  has_many :deliveries
  has_many :enrollments
  has_one :mentor
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  def gitlab_group
    "#{gitlab_user}_hack"
  end

  def gitlab_user
    name_down = self.name.downcase
    last_name_down = self.last_name.downcase
    identity_last = self.identity.split(//).last(4).join

    "#{name_down[0]}#{last_name_down}#{identity_last}"
  end

  def get_gitlab_user
    begin
      Gitlab.users(username:gitlab_user)
    rescue Gitlab::Error::Parsing => error
      return nil
    end
  end

  def create_gitlab_group!
    begin
      group = Gitlab.create_group(self.gitlab_group, self.gitlab_group)
    rescue Gitlab::Error::BadRequest => error
      return nil
    end
    self.name_space_id = group.id
    self.save
  end

  def assign_gitlab_user
    begin
      Gitlab.add_group_member(self.name_space_id, self.gitlab_user_id, 40)
    rescue Gitlab::Error::Conflict => error
      return nil
    end
  end
end
