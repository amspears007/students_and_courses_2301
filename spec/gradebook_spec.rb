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
    art = Course.new('art')
    music = Course.new('music')
    dance = Course.new('dance')

    gradebook.add_course(art)
    gradebook.add_course(music)
    gradebook.add_course(dance)

    expect(gradebook.courses).to match_array([])
  end
end