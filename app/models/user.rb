class User < ApplicationRecord
  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  has_many :friendships
  has_many :friends, through: :friendships
  MAX_STOCKS = 10

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def stock_already_present?(ticker)
    !stocks.where(ticker: ticker).empty?
  end

  def under_stock_limit?
    stocks.count < MAX_STOCKS
  end

  def can_track_stock?(ticker)
    !stock_already_present?(ticker) && under_stock_limit?
  end

  def full_name
    return "#{first_name} #{last_name}" if first_name or last_name
    "Anonymous"
  end
end
