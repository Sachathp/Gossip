class PrivateMessageRecipient < ApplicationRecord
  belongs_to :private_message
  belongs_to :user
end
