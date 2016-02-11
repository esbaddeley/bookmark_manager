class Tag

  include DataMapper::Resource

  property :id, Serial
  property :category, String

  has n, :links, through: Resource

end
