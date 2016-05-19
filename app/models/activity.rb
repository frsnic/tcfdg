class Activity < ActiveRecord::Base
  # extends ...................................................................
  # includes ..................................................................
  # security (i.e. attr_accessible) ...........................................
  # relationships .............................................................
  # validations ...............................................................
  validates_presence_of :name, :start_at

  # callbacks .................................................................
  # scopes ....................................................................
  default_scope { order('start_at DESC') }

  scope :is_public, -> { where(is_public: true) }

  # additional config .........................................................
  paginates_per 10

  # class methods .............................................................
  # public instance methods ...................................................
  # protected instance methods ................................................
  # private instance methods ..................................................

end
