class User < ApplicationRecord
    has_many :tweets
    has_many :tops
    has_many :top_tweets, through: :tops, source: :tweet
    validates :uid, uniqueness: true
end
