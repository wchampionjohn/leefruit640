class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  belongs_to :city, optional: true
  belongs_to :area, optional: true
  has_many :orders

  #validates :password, presence: true, length: { minimum: 6 }, if: :not_login_social?
  #validates :password, :presence => true, :on => :create
  #validates :password_confirmation, presence: true, if: :not_login_social?

  def full_address
    "#{city.name}#{area.name}#{address}"
  end

  def login_social?
    fb_uid.present?
  end

  def not_login_social?
    fb_uid.blank?
  end

  def self.from_omniauth(auth)
    # Case 1: Find existing user by facebook uid
    user = self.find_by_fb_uid( auth.uid )
    if user
      user.fb_token = auth.credentials.token
      user.save!
      return user
    end
    # Case 2: Find existing user by email
    existing_user = self.find_by_email( auth.info.email )
    if existing_user
      existing_user.fb_uid = auth.uid
      existing_user.fb_token = auth.credentials.token
      existing_user.save!
      return existing_user
    end
    # Case 3: Create new password
    user = self.new
    user.fb_uid = auth.uid
    user.fb_token = auth.credentials.token
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name
    user.save!
    user
  end
end
