class User < ApplicationRecord

  validates :email, presence: true
  validates :email, format: {
      with: /\A[a-zA-Z0-9_\.\@]*\z/,
      message: 'only allows alphanumeric characters and underscores'
    }

  has_many :items, -> { order 'created_at desc' }, :foreign_key => "user_uuid"

  def serializable_hash(options = {})
    result = super(options.merge({only: ["email", "uuid"]}))
    result
  end

end
