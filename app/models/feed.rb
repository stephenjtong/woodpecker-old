require 'digest/sha1'

class Feed < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :articles
  attr_accessible :name, :url

  validates_presence_of :url

  before_save :generate_hashed_url

  def generate_hashed_url
    self.hashed_url = Digest::SHA1.hexdigest self.url
  end
end
