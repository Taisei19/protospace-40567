class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :prototypes
  has_many :comments
  
  validates :user_profile   , presence: true
  validates :user_occupation, presence: true
  validates :user_position  , presence: true
end
