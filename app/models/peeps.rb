class Peep

  include DataMapper::Resource

  property :id,       Serial
  property :name,     String
  property :username, String
  property :content,  String, :length => 1..450

  # belongs_to :user

end
