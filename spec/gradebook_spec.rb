require './lib/student'
require './lib/course'
require './lib/gradebook'

RSpec.describe GradeBook do
    let(:gradebook) {GradeBook.new("Erin")}
    let(:art)  {Course.new('art', 10)}
    let(:music) {Course.new('music', 3)}
    let(:dance)  {Course.new('dance', 2)}
    let(:student1) {Student.new({name: "Morgan", age: 21})}
    let(:student2)  {Student.new({name: "Jordan", age: 29})}

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

    art = Course.new('art', 10)
    music = Course.new('music', 3)
    dance = Course.new('dance', 2)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29}) 

    gradebook.add_course(art)
    gradebook.add_course(music)
    gradebook.add_course(dance)

    art.enroll(student1)
    dance.enroll(student1)
    dance.enroll(student2)

    expected = {art => [student1], dance => [student1, student2], music => []}

    expect(gradebook.list_all_students).to eq(expected)
    # "course" => [student, student2]
  end

  it 'determines if student is below threshold' do
    #`students_below(threshold)` | `Array` of `Student` objects
    #ake array for students_below 
    gradebook.add_course(art)
    gradebook.add_course(music)
    gradebook.add_course(dance)

    art.enroll(student1)
    dance.enroll(student2)
    music.enroll(student2)

    student1.log_score(70)
    student2.log_score(81)
    student2.log_score(95)

    expect(gradebook.students_below(75)).to eq([student1])
  end
end