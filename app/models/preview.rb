class Preview < ActiveRecord::Base
  # extends ...................................................................
  # includes ..................................................................
  # security (i.e. attr_accessible) ...........................................
  # relationships .............................................................
  # validations ...............................................................
  # callbacks .................................................................
  after_initialize :set_defaults, unless: :persisted?

  # scopes ....................................................................
  # additional config .........................................................
  # class methods .............................................................
  def set_defaults
    self.token ||= SecureRandom.uuid
  end

  # public instance methods ...................................................

end
