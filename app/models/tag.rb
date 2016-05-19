class Tag < ActiveRecord::Base
  # extends ...................................................................
  # includes ..................................................................
  # security (i.e. attr_accessible) ...........................................
  # relationships .............................................................
  has_many :post_tags, dependent: :destroy

  has_many :posts, through: :post_tags

  # validations ...............................................................
  # callbacks .................................................................
  # scopes ....................................................................
  scope :publish_post, -> { where(posts: { post_type: 'post', status: 'publish' }) }

  # additional config .........................................................
  paginates_per 10

  # class methods .............................................................
  # public instance methods ...................................................
  # protected instance methods ................................................
  # private instance methods ..................................................

end
