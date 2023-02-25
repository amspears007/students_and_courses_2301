class GradeBook
  attr_reader :instructor, 
              :courses,
              :student_below

  def initialize(instructor)
    @instructor = instructor
    @courses = []
    @student_below = []
  end


  
  def add_course(course)
    courses << course
    # add to list_all_students
    # list_all_students[course] = course.students
  end


  def list_all_students    
    student_hash = {}
    courses.each do |course|
      student_hash[course] = course.students 
    end
      student_hash
  end

  def students_below(scores)
    
     courses.map do |course|
      course.students.each do |student|
        @student_below << student if student.grade < scores
      end
    end
    @student_below.uniq
    #diff solution using student hash from above
    # list_all_students.map do |k, students|
    #   students.select do |student|
    #     if student.grade < scores
    #       student_below << student
    #     end
    #   end
    # end
    # student_below.uniq
  end
end

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  #diff syntax solution for list_all_students_hash
    #hash_res = {}
    # courses.group_by(&:students)
    # courses.each { |course| hash_res[course] => course.students }
    # hash_res


  # list all students hash
  # { key => value }
  # { 
      # <Course#1231723> => [ <Student#1234>, <Student#481283> ],
      # <Course#123133> => [ <Student#1434>, <Student#83> ] 
  # }

  # list_all_students = Hash.new { |h,k,v| h[k] = [] }
  # list_all_students = {}
  # list_all_students.default_proc = Proc.new { |h,k,v| h[k] = []} #list_all_students[course3]
  # list_all_students[course] << student_1
  # list_all_students[course] << student_2
  # list_all_students[course] << student_3
  # list_all_students[course2] << student_4
  
  # def list_all_students
  #   all_students = {}
  #   @courses.each do |course|
  #     all_students[course.name] = course.students   
  #   end
  #   all_students
  # end

# end

  # def courses
  #   list_all_students.keys
  # end

  # def students
  #   list_all_students.values.flatten
  # end
