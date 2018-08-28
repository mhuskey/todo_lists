class Item < ApplicationRecord
  
  belongs_to :list
  
  validates :task, presence: true
  
  def completed?
    complete?
  end
  
  def toggle_complete
    if complete?
      update_attribute(:complete, false)
    else
      update_attribute(:complete, true)
    end
  end
  
end
