class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :histories

  validates :name, presence: true

  validates :username, presence: true, uniqueness: true

  after_initialize :set_defaults

  def set_defaults
    self.admin = false if self.new_record?
  end
end
