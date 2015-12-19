class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :authentication_keys => [:username]
  validates_presence_of :username
  has_many :authorizations

  def self.new_with_session(params,session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"],without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def self.from_omniauth(auth, current_user)
    authorization = Authorization.where(:provider => auth.provider, :uid => auth.uid.to_s, :token => auth.credentials.token, :secret => auth.credentials.secret).first_or_initialize
    if authorization.user.blank?
      user = current_user || User.where('username = ?', auth["info"]["nickname"]).first
      if user.blank?
       user = User.new
       user.name = auth.info.name
       user.password = Devise.friendly_token[0,20]
       user.username = auth.info.nickname
       user.image_url = auth.info.image
       user.save
     end
     authorization.username = user.name
     authorization.user_id = user.id
     authorization.save
   end
   authorization.user
  end

  # We have to include this since we are strictly using Twitter to login
  def email_required?
    false
  end

  def email_changed?
    false
  end

end
