require './lib/student'
require './lib/course'
require './lib/gradebook'

RSpec.describe GradeBook do
  it 'exists' do
    gradebook = GradeBook.new("Erin")

    expect(gradebook).to be_a(GradeBook)
  end
end