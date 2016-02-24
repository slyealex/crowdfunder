class Project < ActiveRecord::Base
  belongs_to :user
  has_many :pledges
  has_many :rewards
  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true


  def total_amount
    self.pledges.sum :amount
  end

end
