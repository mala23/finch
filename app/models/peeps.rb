class Peep

  include DataMapper::Resource

  property :id,       Serial
  property :username, String
  property :content,  String

end
