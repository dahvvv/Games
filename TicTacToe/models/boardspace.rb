class Boardspace < ActiveRecord::Base
  belongs_to :game

  def get_selected(username)
    if self.status == "empty"
      self.status = username
      self.save!
    else
      return "You can't select this space, it's already occupied!"
    end
  end

end
