class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: "User"
  has_many :private_message_recipients
  has_many :recipients, through: :private_message_recipients, source: :user
end
