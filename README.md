# AnagramGables
(pronounced like Anne of Green Gables)

Simple anagram finder based on known set of all possible words.
Defaults to reading from /usr/shared/dict/words. (Sorry windows users)


## Usage

Just load the console and poke around

```ruby
cd /path/to/anagram_gables
./bin/console

# Simple lookup
[1] pry(AnagramGables)> match 'yellow'
building index...1780 ms
=> ["yellow"]

[2] pry(AnagramGables)> match 'anger'
=> ["anger", "areng", "grane", "range"]

# Get all by largest number of anagrams 
[3] pry(AnagramGables)> puts by_freq[0..10]
10, elaps lapse lepas pales salep saple sepal slape spale speal
10, angor argon goran grano groan nagor orang organ rogan ronga
9, asteer easter eastre reseat saeter seater staree teaser teresa
9, ester estre reest reset steer stere stree terse tsere
9, armet mater merat metra ramet tamer terma trame trema
9, caret carte cater crate creat creta react recta trace
8, laster lastre rastle relast resalt salter slater stelar
8, arist astir sitar stair stria tarsi tisar trias
8, leapt palet patel pelta petal plate pleat tepal
8, ante aten etna nate neat taen tane tean
7, acrolein arecolin caroline colinear cornelia creolian lonicera
=> nil

# Get all by longest word that is still an anagram
[4] pry(AnagramGables)> puts by_length[0..10]
22, hydropneumopericardium pneumohydropericardium
22, cholecystoduodenostomy duodenocholecystostomy
21, chromophotolithograph photochromolithograph
21, duodenopancreatectomy pancreatoduodenectomy
21, anatomicopathological pathologicoanatomical
21, glossolabiopharyngeal labioglossopharyngeal
20, glossolabiolaryngeal labioglossolaryngeal
20, encephalomeningocele meningoencephalocele
20, anatomicophysiologic physiologicoanatomic
19, clinicopathological pathologicoclinical
19, esophagogastrostomy gastroesophagostomy
=> nil
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'anagram_gables'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install anagram_gables

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ddrscott/anagram_gables.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

