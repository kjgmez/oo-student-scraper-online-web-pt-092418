require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    site = Nokogiri::HTML(open(index_url))
    student_card = site.css('div.roster-cards-container')
    student_card.each do |info|
      stu = Student.new
      stu.name = info.css('a div.card-text-container')
      stu.location = info.css('a div.card-text-container')
      stu.profile_url = info.css('a div.card-text-container')
    end
    binding.pry
  end

  def self.scrape_profile_page(profile_url)

  end

end
