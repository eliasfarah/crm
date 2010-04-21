class Task < ActiveRecord::Base
  STATUS =  %w(open closed)
  PRIORITY = %w(normal low high)
  
  belongs_to :owner, :class_name =>"User"
  belongs_to :project
  
  validates_presence_of :title, :description, :owner, :project
  validates_associated :project
  validates_numericality_of :progress, :only_integer=>true, :allow_nil=>true
  validates_inclusion_of :status, :in => STATUS
  validates_inclusion_of :priority, :in => PRIORITY
  
  after_create :register_create
  after_update :register_update
  after_update :notify_owner
  
  named_scope :open, :conditions => { :status=> "open" }
  named_scope :closed, :conditions => { :status => "closed" }
  named_scope :high, :conditions => { :priority => "high" }
  named_scope :low, :conditions => { :priority => "low" }
  
  
protected
  def register_create
    Log.create(:message=>"Task: '#{self.title}' created by '#{self.owner.name}'")
  end
  
  def register_update
    Log.create(:message=>"Task: '#{self.title}' updated by '#{self.owner.name}'")
  end
  
  def notify_owner
    TaskNotifier.deliver_update_notification(self)
  end
end
