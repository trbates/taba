class Client < ActiveRecord::Base
  has_many :projects
  validates_presence_of :name, :email, :contact
  validates_uniqueness_of :email

  def self.tasks
    Rails.cache.fetch "client_task_listZ" do
      self.find(:all, :limit => 10)
    end
  end
end
