class Boardspace < ActiveRecord::Base
  belongs_to :game

  def get_selected(user_id)
    if self.status == "empty"
      self.status = user_id
      self.save!
    end
  end

end
