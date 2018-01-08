class ShortenedUrl < ApplicationRecord
  validates :original, :presence => true

end
