class Autologin < ActiveRecord::Base

  belongs_to :user

  attr_protected  :code, :user_id
  before_create :generate_code

  validates_uniqueness_of :user_id

  # perform authorization
  def self.authorize(code)
    find_by_code(code)
  end

  # generate link (path - wihtout host) for user authologin
  def generate_link
    'autologin/'+code
  end

  private

  # prepare random code for autologin
  def generate_code
    self.code = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{user_id}--#{rand(256)}")[0,32]
  end

end
