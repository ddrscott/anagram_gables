require 'anagram_gables/version'
require 'benchmark'

module AnagramGables
  module_function

  def index(src:'/usr/share/dict/words', min: 2)
		@index ||= Hash.new{|h,k| h[k] = []}.tap do |index|
      $stderr.print 'building index...'
      ms = Benchmark.measure do
        IO.foreach(src) do |word|
          key, word = norm(word)
          if word.size >= 2
            index[key] |= [word]        # union
          end
        end
      end
      $stderr.puts "#{(ms.real * 1000).to_i} ms"
		end
  end

  def norm(word)
    word = word.strip.downcase
    key = word.chars.sort.join
    [key, word]
  end

  def match(text)
    key, _ = norm(text)
    index[key]
  end

  def by_freq
    index
      .sort_by{|k,v| [-v.size,-k.size]}
      .map{|k,v| [v.size, v * ' '] * ', '}
  end

  def by_length
    index
      .select{|_,v| v.size > 1}
      .sort_by{|k,v| -k.size}
      .map{|k,v| [k.size, v * ' '] * ', '}
  end
end

