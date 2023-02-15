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
    art = Course.new('art', 10)
    music = Course.new('music', 3)
    dance = Course.new('dance', 2)

    gradebook.add_course(art)
    gradebook.add_course(music)
    gradebook.add_course(dance)

    expect(gradebook.list_all_students).to be_a(Hash)
  end
end