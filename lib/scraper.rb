require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    site = Nokogiri::HTML(open(index_url))
    student_card = site.css('div.roster-cards-container div.student-card')
    student_card.each do |info|
      stu = {}
      stu[:location] = info.css('a div.card-text-container p').text
      stu[:name] = info.css('a div.card-text-container h4').text
      stu[:profile_url] = info.css('a').attribute('href').value
      Student.new(stu)
      binding.pry
    end
    #binding.pry
  end

  def self.scrape_profile_page(profile_url)
    site = Nokogiri::HTML(open(profile_url))

  end

end
