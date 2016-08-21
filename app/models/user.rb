class User < ActiveRecord::Base
  include Gravtastic
  gravtastic :size => 512, :default => "identicon"

  has_many :articles
  has_many :offers
  has_many :comments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def fullname
    firstname + " " + lastname
  end

  def member?
    (status == 0 or status == 1)
  end

  def teacher?
    (status == 2)
  end
end
