class Category < ActiveRecord::Base
  # extends ...................................................................
  # includes ..................................................................
  include Models::Handle

  # security (i.e. attr_accessible) ...........................................
  # relationships .............................................................
  has_many :category_posts, dependent: :destroy

  has_many :posts, through: :category_posts

  # validations ...............................................................
  validates_presence_of :name
  validates_uniqueness_of :name, :handle

  # callbacks .................................................................
  before_save do
    self.handle_valid(self.name, Category) if self.handle.blank?
  end

  # scopes ....................................................................
  scope :publish_post, -> { where(posts: { post_type: 'post', status: 'publish' }) }

  # additional config .........................................................
  paginates_per 10

  # class methods .............................................................
  # public instance methods ...................................................
  # protected instance methods ................................................
  # private instance methods ..................................................

end
