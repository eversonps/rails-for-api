class Contact < ApplicationRecord
  belongs_to :kind, optional: true
  has_many :phones
  has_one :address
  
  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true

  paginates_per 5
  
  validates_presence_of :kind
  # validates_presence_of :address

  
  # def to_br
  #   { 
  #     name: self.name,
  #     email: self.email,
  #     birthdate: (I18n.l(self.birthdate) unless self.birthdate.black?)
  #   }
  # end

  # def author 
  #   "Jackson Pires"
  # end

  # def kind_description 
  #   self.kind.description
  # end

  # def as_json(options={})
  #   super(
  #     methods: [:kind_description, :author],
  #     root: true,
  #   )
  # end

  # def hello
  #   I18n.t('hello')
  # end

  # def i18n
  #   I18n.default_locale
  # end
end
