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
  validates :concept,      presence: true
  validates :category_id,  presence: true
  validates :condition_id, presence: true
  validates :charge_id,    presence: true
  validates :sender_id,    presence: true
  validates :period_id,    presence: true
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, presence: { message: 'には半角数字を使用してください' }
  end
end
