class MunchiesSerializer
  include JSONAPI::Serializer

  attributes :name, :address, :rating, :reviews
end