class Project < ActiveRecord::Base
  belongs_to :user
  has_many :pledges
  has_many :rewards
  has_many :categories
  # rhas_many :user_pledges, through: :user, class_name: 'Pledge', source: "projects"
  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true




  def total_amount
    self.pledges.sum :amount
  end

  # def user_pledges
  #   Pledge.all.where(project_id: self.id, user_id: self.user.id)
  # end

end
