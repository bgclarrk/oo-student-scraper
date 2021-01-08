require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  
  def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)

    student_data = doc.css(".student-card")

    students_array = []
    students_hash = {}
    i = 1

    while i < student_data.count
      student_data.each do | student |
        student_name = student_data.css(".card-text-container .student-name")[i].text
        profile_url = index_url + "/" + student_data.css("a")[i]["href"]
        students_hash = {
          name: student_name,
          location: nil,
          twitter: nil,
          linkedin: nil,
          github: nil,
          blog: nil,
          profile_quote: nil,
          bio: nil,
          profile_url: profile_url
        }
      end
      students_array << students_hash
      i += 1
    end
    students_array
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

