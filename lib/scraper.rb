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

    student_cards = site.css('div.roster-cards-container div.student-card')
    #binding.pry
    student_card.each do |info|
      stu = {}
      stu[:name] = info.css('a div.card-text-container h4')
      stu[:location] = info.css('a div.card-text-container p').text
      stu[:profile_url] = info.css('a').attribute('href').text
      arr << stu
    end
    arr
  end

  def self.scrape_profile_page(profile_url)
    site = Nokogiri::HTML(open(profile_url))
    info = site.css('div.vitals-container')
    quote = site.css('div.details-container')
    social = info.css('div.social-icon-container a')
    stud = {}
    links = []
    keys = ['twiter', 'linkedin', 'github', 'blog']
    social.collect{|link| links << link.attribute('href').value}
    keys.zip(links) { |key,val| stud[key.to_sym] = val}
    #binding.pry
    stud[:profile_quote] = info.css('div.vitals-text-container div.profile-quote').text
    stud[:bio] = quote.css('div.details-container div.bio-block div.bio-content div.description-holder').text
    #binding.pry
  end
end
