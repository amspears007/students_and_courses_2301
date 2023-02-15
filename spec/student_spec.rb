require './lib/student'

RSpec.describe Student do
  it 'exists' do
    student = Student.new({name: "Morgan", age: 21}) 

    expect(student).to be_a(Student) 
  end

  it 'has a name and age' do
    student = Student.new({name: "Morgan", age: 21}) 

    expect(student.name).to eq("Morgan")
    expect(student.age).to eq(21)
  end

  it 'starts with no scores' do
    student = Student.new({name: "Morgan", age: 21}) 

    expect(student.scores).to eq([])
  end

  it 'can log scores and store them in an array' do
    student = Student.new({name: "Morgan", age: 21}) 
    student.log_score(89)
    student.log_score(78)

    expect(student.log_scores).to match_array([89, 78])
  end
end