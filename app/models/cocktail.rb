class Cocktail < ActiveRecord::Base
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  has_attached_file :photo,
    styles: { banner: "800x300#", thumb: "160x60#" }

  validates_attachment_content_type :photo,
    content_type: /\Aimage\/.*\z/

  validates_presence_of :name
end
