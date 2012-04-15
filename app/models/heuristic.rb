class Heuristic < ActiveRecord::Base
  belongs_to :report
  
  def summary
    self.title ? self.title.truncate(30) : ""
  end
end
