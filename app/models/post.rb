class Post < ActiveRecord::Base
  # extends ...................................................................
  # includes ..................................................................
  # security (i.e. attr_accessible) ...........................................
  # relationships .............................................................
  # validations ...............................................................
  # callbacks .................................................................
  # scopes ....................................................................
  default_scope { order('id DESC') }

  scope :attachment, -> { where(post_type: 'attachment') }

  scope :nav_menu_item, -> { where(post_type: 'nav_menu_item') }

  scope :page, -> { where(post_type: 'page') }

  scope :post, -> { where(post_type: 'post') }

  scope :revision, -> { where(post_type: 'revision') }

  scope :safecss, -> { where(post_type: 'safecss') }

  scope :wpcf7_contact_form, -> { where(post_type: 'wpcf7_contact_form') }

  scope :publish, -> { where(status: "publish") }

  # additional config .........................................................
  # class methods .............................................................
  # public instance methods ...................................................
  def summary(length = 150)
    (excerpt.present? ? excerpt : content).truncate(length)
  end

end
