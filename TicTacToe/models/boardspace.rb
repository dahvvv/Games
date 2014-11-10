class Boardspace < ActiveRecord::Base
  belongs_to :game

  def get_selected(user_id)
    if self.status == "empty"
      self.status = user_id
      self.save!
    end
  end

  def x_o_from_status
    if self.status == "empty"
      return "empty"
    else
      return (User.find(self.status)).x_or_o
    end
  end

end
