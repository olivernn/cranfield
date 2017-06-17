require 'set'

module Cranfield
  class Document
    RequiredFields = Set.new %i(id title author abstract bibliography)

    attr_reader :id, :title, :author, :abstract, :bibliography

    def initialize(attrs = {})
      @id = attrs.fetch(:id)
      @title = attrs.fetch(:title)
      @author = attrs.fetch(:author)
      @abstract = attrs.fetch(:abstract)
      @bibliography = attrs.fetch(:bibliography)
    end

  end
end
