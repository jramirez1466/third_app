class User < ActiveRecord::Base
  attr_accessible :email, :name

 validates :name, presence: true, length: { maximum: 30}
 VAKLID_EMAIL_REGEX =
 validates :email, presence: true
end
