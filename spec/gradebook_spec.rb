require './lib/student'
require './lib/course'
require './lib/gradebook'

RSpec.describe GradeBook do
  it 'exists has an instructor and starts with no courses' do
    gradebook = GradeBook.new("Erin")

    expect(gradebook).to be_a(GradeBook)
    expect(gradebook.instructor).to eq("Erin")
    expect(gradebook.courses).to eq([])
  end

  it 'can add courses' do
    gradebook = GradeBook.new("Erin")
    art = Course.new('art', 10)
    music = Course.new('music', 3)
    dance = Course.new('dance', 2)

    gradebook.add_course(art)
    gradebook.add_course(music)
    gradebook.add_course(dance)

    expect(gradebook.courses).to match_array([art, music, dance])
  end

  it 'can list all students in course' do
    gradebook = GradeBook.new("Erin")
    gradebook2 = GradeBook.new("Dani")
    calculus = Course.new("Calculus", 2) 
    art = Course.new('art', 10)
    music = Course.new('music', 3)
    dance = Course.new('dance', 2)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29}) 

    gradebook.add_course(art)
    gradebook.add_course(music)
    gradebook2.add_course(calculus)

    music.enroll(student1)
    art.enroll(student1)
    art.enroll(student2)

    expect(gradebook.list_all_students).to eq({"music" => [student1], "art" => [student1, student2]})
    expect(gradebook.list_all_students).to be_a(Hash)
    
  end
end