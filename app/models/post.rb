class Post < ActiveRecord::Base
  # extends ...................................................................
  # includes ..................................................................
  include Models::Handle

  # security (i.e. attr_accessible) ...........................................
  # relationships .............................................................
  belongs_to :user, counter_cache: true

  has_many :post_tags, dependent: :destroy

  has_many :tags, through: :post_tags

  has_many :category_posts, dependent: :destroy

  has_many :categories, through: :category_posts

  has_many :comments, dependent: :destroy

  has_many :images, dependent: :destroy

  has_one :post_meta, dependent: :destroy

  accepts_nested_attributes_for :post_meta

  # validations ...............................................................
  validates_presence_of :title, :content

  # callbacks .................................................................
  before_save do
    self.handle_valid(self.title, Post) if self.handle.blank?
    self.image_responsive
    self.set_images
    self.set_excerpt if self.excerpt.blank?
  end

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

  def image_responsive
    doc = Nokogiri::HTML self.content
    doc.xpath("//img").each do |img|
      image_tag = %Q(<img src="#{img['src']}", width="#{img['width']}", height="#{img['height']}", class="img-responsive">)
      img.replace(image_tag)
    end
    self.content = doc.to_html
  end

  def set_images
    doc = Nokogiri::HTML self.content
    links = []
    doc.xpath("//img").each do |img|
      links << img['src']
    end
    Ckeditor::Picture.find_each do |picture|
      if links.include? picture.url
        self.images.find_or_create_by(picture_id: picture.id)
        links.delete(picture.url_content)
      end
      break if links.blank?
    end
    self.main_picture_id = self.images.first.try(:picture_id) unless self.main_picture_id
  end

  def set_excerpt
    self.excerpt = ActionController::Base.helpers.strip_tags(self.content.delete("\n")).truncate(255)
  end

  def main_picture
    Ckeditor::Picture.find_by_id self.main_picture_id
  end

  def main_picture_url
    self.main_picture_id ? self.main_picture.url : ""
  end

  def summary(length = 150)
    self.excerpt.truncate(length)
  end

  # protected instance methods ................................................
  # private instance methods ..................................................

end
