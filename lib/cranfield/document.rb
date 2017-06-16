module Cranfield
  class Document
    attr_reader :id, :title, :author, :abstract

    def initialize(attrs = {})
      @id = attrs.fetch(:id)
      @title = attrs.fetch(:title)
      @author = attrs.fetch(:author)
      @abstract = attrs.fetch(:abstract)
    end
  end
end
