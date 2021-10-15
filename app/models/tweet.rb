class Tweet < ApplicationRecord

    has_many :tops
    has_many :top_users, through: :tops, source: :user
end
