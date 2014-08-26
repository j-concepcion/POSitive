class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :trackable, :validatable, :lockable, :timeoutable
  has_many :order_slips
  
  include PublicActivity::Common
  
  validates :first_name, :last_name, :email, presence: true
  
  enum status: { active: 0, archived: 1 } # explicitly declare the mapping, avoid headaches
  after_initialize {self.active! if self.status.nil?}

  ROLES = Base::Settings.application.roles
  
  def roles=(roles)
    self.roles_mask = roles.inject(0){|sum, role| (rindex = ROLES.index(role)).nil? ? sum :  sum + 2**rindex }
  end

  def roles
    @roles ||= ROLES.reject { |r| ((self.roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end

  def is?(role)
    roles.include?(role.to_s)
  end
  
  ROLES.each do |role|
    define_method("is_#{role}?"){ is?(role) }
  end

  after_save do
    @roles = nil # reset so it is reevaluated
  end

  def name
    [first_name, last_name].join(' ')
  end
end
