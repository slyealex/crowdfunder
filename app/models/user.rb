class User < ActiveRecord::Base
  has_secure_password

  has_many :projects
  # has_many :project is a perspective of owner
  has_many :pledges

  has_many :backed_projects, class_name: Project, through: :pledges, source: :project
  # source: :project this association is called project from pledges poit of view".
# A perspective of backer. Added new association :backed_projects, cause projects we has before directly was
# from the owners point of view. From the backers point of view we have many projects
# through pledgeds. We put a class_name "Project" to let rail know that backed_projects is
# the same ting as project. We added source: after through :pledges to let Pledge model
# know that backed_project is the same as project too.


end
