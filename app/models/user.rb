class User < ActiveRecord::Base

  has_many :carts
  belongs_to :current_cart, class_name: 'Cart'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google]

 def self.from_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
   end
 end

  def create_current_cart
    new_cart = self.carts.create
    self.current_cart_id = new_cart.id
    save
  end

  def remove_cart
    self.current_cart = nil
    save
  end

end
