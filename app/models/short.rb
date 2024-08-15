class Short < ApplicationRecord
  validates :long_url, presence: true
  before_create :generate_short_url


  def increment_counter
    self.counter = self.counter + 1
  end

  private

  def generate_short_url
    self.short_url = SecureRandom.urlsafe_base64(6)
  end
end
