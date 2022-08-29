class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :sender
  belongs_to :period

  belongs_to :user
  # has_one :purchase_record
  has_one_attached :image

  validates :title,        presence: true
  validates :cocept,       presence: true
  validates :category_id,  presence: true
  validates :condition_id, presence: true
  validates :charge_id,    presence: true
  validates :sender_id,    presence: true
  validates :period_id,    presence: true
  validates :price,        presence: true
end
