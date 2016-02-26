require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'anagram_gables'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

namespace :db do

  desc 'create required sqlite tables'
	task :create do
		ActiveRecord::Migration.class_eval do
			create_table :anagrams, id: false do |t|
				t.string :key, index: :unique
				t.integer :a, default: 0
				t.integer :b, default: 0
				t.integer :c, default: 0
				t.integer :d, default: 0
				t.integer :e, default: 0
				t.integer :f, default: 0
				t.integer :g, default: 0
				t.integer :h, default: 0
				t.integer :i, default: 0
				t.integer :j, default: 0
				t.integer :k, default: 0
				t.integer :l, default: 0
				t.integer :m, default: 0
				t.integer :n, default: 0
				t.integer :o, default: 0
				t.integer :p, default: 0
				t.integer :q, default: 0
				t.integer :r, default: 0
				t.integer :s, default: 0
				t.integer :t, default: 0
				t.integer :u, default: 0
				t.integer :v, default: 0
				t.integer :w, default: 0
				t.integer :x, default: 0
				t.integer :y, default: 0
				t.integer :z, default: 0
				t.string  :words
			end
		end
	end
end
