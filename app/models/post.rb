class Post < ActiveRecord::Base
  # extends ...................................................................
  # includes ..................................................................
  # security (i.e. attr_accessible) ...........................................
  # relationships .............................................................
  belongs_to :user

  has_many :post_tags, dependent: :destroy

  has_many :tags, through: :post_tags

  has_many :category_posts, dependent: :destroy

  has_many :categories, through: :category_posts

  has_many :comments

  # validations ...............................................................
  # callbacks .................................................................
  # scopes ....................................................................
  default_scope { order('posted_at DESC') }

  scope :attachment, -> { where(post_type: 'attachment') }

  scope :nav_menu_item, -> { where(post_type: 'nav_menu_item') }

  scope :wp_page, -> { where(post_type: 'page') }

  scope :post, -> { where(post_type: 'post') }

  scope :revision, -> { where(post_type: 'revision') }

  scope :safecss, -> { where(post_type: 'safecss') }

  scope :wpcf7_contact_form, -> { where(post_type: 'wpcf7_contact_form') }

  scope :preview, -> { where(post_type: 'preview') }

  scope :publish, -> { where(status: "publish") }

  # additional config .........................................................
  paginates_per 10

  # class methods .............................................................
  # public instance methods ...................................................
  def post?
    post_type == "post"
  end

  def publish?
    status == "publish"
  end

end
