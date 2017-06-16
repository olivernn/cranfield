module Cranfield
  class Parser
    def initialize(io)
      @io = io
    end

    def documents
      Enumerator.new do |y|
      end
    end
  end
end

__END__

Cranfield.load(some_path)

Cranfield::Parser.new(io)

parser.documents.each do |document|
end
