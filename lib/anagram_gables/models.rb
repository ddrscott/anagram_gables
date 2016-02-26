module AnagramGables
  ActiveRecord::Base.logger = Logger.new('anagram.log')

  ActiveRecord::Base.establish_connection(
      adapter: 'sqlite3',
      #:dbfile  => ":memory:"
      database: 'db.sqlite3'
  )

  class Anagram < ActiveRecord::Base
    def key=(k)
      k.chars
        .group_by{|g|g}
        .select{|g,_| g >= 'a' and g <= 'z'}
        .each{|g, gs| send("#{g}=", items.size)}
      super
    end

    def self.match(phrase)
      letters = AnagramGables.letter_hash(phrase)
      zero_letters = letters.select{|_,n| n == 0}
      with_letters = letters.select{|_,n| n > 0}

      sql = <<-SQL
select
  #{with_letters.map{|c,_| c} * ','},
  group_concat(words, '|') as words,
  group_concat(key) as key,
  #{zero_letters.map{|c,_| "0 as #{c}"} * ','}
from anagrams
where #{zero_letters.map{|c,n| "#{c}=#{n}"} * ' and '}
group by #{with_letters.map{|c,_| c} * ','}
order by words
      SQL

      puts "\e[37m#{sql}\e[0m"

      find_by_sql(sql)
    end
  end
end
__END__
rot get he
there got
grot thee
Thor teeg

eeghortt


eeghortt  | 0 | 0 | 0 | 0 | 2 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | together
ot        | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | to
egt       | 0 | 0 | 0 | 0 | 1 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | get|teg
ehr       | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | her|reh|rhe

eeghortt


