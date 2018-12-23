class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    student_hash.each{|key, value| self.send("#{key}=", value)}
    self.class.all << self
  end

  def self.create_from_collection(students_array)
    students_array.each{|student_hash| Student.new(student_hash)}
    #binding.pry
  end

  def add_student_attributes(attributes_hash)
    self.send("twitter=", attributes_hash[:twitter])
    self.send("linkedin=", attributes_hash[:linkedin])
    self.send("github=", attributes_hash[:github])
    self.send("blog=", attributes_hash[:blog])
    self.send("profile_quote=", attributes_hash[:profile_quote])
    self.send("bio=", attributes_hash[:bio])
    #binding.pry
  end

  def self.all
    @@all
  end
end

