#!/usr/bin/env ruby

require 'mechanize'

agent = Mechanize.new

page = agent.get('http://sfbay.craigslist.org/search/pen/apa')

puts page.title

page.search('p.row').each do |h|

	title = h.search('a').text
	location = h.search('small').text.strip.gsub(/[()]/, '')
	price = h.search('span.price').text.strip

	if location == 'palo alto'
		puts title + ': ' + location + ', ' + price
	end
end

