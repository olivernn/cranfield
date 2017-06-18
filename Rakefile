$LOAD_PATH.unshift 'lib'

require 'cranfield'
require 'json'

directory 'output'

file 'output/corpus.json' => 'output' do |t|
  corpus = Cranfield::Document.load('data/cran/cran.all.1400').map(&:to_h)

  File.open(t.name, 'w') do |f|
    f << JSON.generate(corpus)
  end
end

task :clean do
  rm_rf 'output'
end

task :generate => 'output/corpus.json'

task :default => :generate
