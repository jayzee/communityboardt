# == Schema Information
#
# Table name: attendees
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Attendee < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  def self.top_attendees
    User.joins(:attendees).group('users.id').order('count(users.id) DESC').limit(5)
  end

end
