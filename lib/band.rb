class Band < ActiveRecord::Base
  has_and_belongs_to_many(:venues)
  before_save(:upcase)
  validates(:name, :presence => true)
  
  private

  def upcase
    self.name=(name.downcase.titlecase)
  end
end
