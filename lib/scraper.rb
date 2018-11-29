require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    site = Nokogiri::HTML(open(index_url))
    student_cards = site.css('div.roster-cards-container div.student-card')
    binding.pry
    student_card.each do |info|
      stu = Student.new
      stu.name = info.css('a div.card-text-container h4')
      stu.location = info.css('a div.card-text-container p').text
      stu.profile_url = info.css('a').attribute(href).text
    end
  end

  def self.scrape_profile_page(profile_url)

  end

end
