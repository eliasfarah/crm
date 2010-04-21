class Project < ActiveRecord::Base
  belongs_to :customer

  has_many :documents, :dependent => :destroy
  has_many :contracts
  has_many :tasks
  has_many :implementors, :through=> :tasks, :source=> :owner
  
  has_and_belongs_to_many :members, :class_name=>"User", :join_table => "projects_members", :association_foreign_key => "member_id"
  
  validates_associated :customer, :members
  validates_presence_of :customer, :name
  validates_uniqueness_of :name
  
  named_scope :actives, :conditions => {:active=>true}
  named_scope :inactives, :conditions => {:active=>false}
  
end
