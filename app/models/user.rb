class User < ActiveRecord::Base
  # extends ...................................................................
  # includes ..................................................................
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # security (i.e. attr_accessible) ...........................................
  # relationships .............................................................
  has_many :posts, dependent: :destroy

  has_many :previews, dependent: :destroy

  # validations ...............................................................
  validates_presence_of :email, :identify
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  # callbacks .................................................................
  before_save do
    self.name = self.identify if self.name.blank?
  end

  # scopes ....................................................................
  # additional config .........................................................
  enum role: [:admin, :editor, :author]

  # class methods .............................................................
  # public instance methods ...................................................
  # protected instance methods ................................................
  # private instance methods ..................................................

end
