require "pry"

class User < ActiveRecord::Base
  has_many :posts

  # TODO: Add some validation
  validates :username, presence: true, uniqueness: true
  validates :email, format: { with: /\A.*@.*\.com\z/ }, presence: true

  # TODO: Add some callbacks
  before_validation :strip_email
  after_create :welcome_email

  def strip_email
    if email.nil?
      "sem email"
    else
      email.strip!
    end
  end

  def welcome_email
    FakeMailer.instance.mail(email, "Welcome !!!")
  end
end
