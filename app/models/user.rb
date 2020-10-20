class User < ApplicationRecord
    has_many :ratings
    has_many :locations, through: :ratings
end
