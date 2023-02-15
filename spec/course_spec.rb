require './lib/student'
require './lib/course'

RSpec.describe Course do
  it 'exists' do
    course = Course.new("Calculus", 2) 
  
    expect(course).to be_a(Course)
end

  it 'has a name and capacity' do
  course = Course.new("Calculus", 2) 

  expect(course.name).to eq("Calculus")
  expect(course.capacity).to eq(2)
  end
end