require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    site = Nokogiri::HTML(open(index_url))
    arr = []
    student_card = site.css('div.roster-cards-container div.student-card')
    student_card.each do |info|
      stu = {}
      stu[:location] = info.css('a div.card-text-container p').text
      stu[:name] = info.css('a div.card-text-container h4').text
      stu[:profile_url] = info.css('a').attribute('href').value
      arr << stu
      #binding.pry
    end
    arr
    #binding.pry
  end

  def self.scrape_profile_page(profile_url)
    site = Nokogiri::HTML(open(profile_url))
    info = site.css('div.vitals-container')
    social = info.css('div.social-icon-container a').attribute('href').value
    binding.pry
    info.each do |item|
      stud = {}
      stud[:twitter] = item.css('q')
      stud[:linkedin] = item.css()
      stud[:github] = item.css()
      stud[:blog] = item.css()
      stud[:profile_quote] = item.css()
      stud[:bio] = item.css()
    end
  end
end
