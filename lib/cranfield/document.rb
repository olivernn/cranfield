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

    def to_h
      {
        id: id,
        title: title,
        author: author,
        abstract: abstract,
        bibliography: bibliography,
      }
    end

    def self.load(pathname)
      Enumerator.new do |y|
        File.open(pathname) do |source|
          parser = Parser.parse(source)

          loop do
            document = parser.resume
            break if document == :eos
            y << document
          end
        end
      end
    end
  end
end
