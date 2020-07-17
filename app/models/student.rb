require 'pry'

class Student

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        Student.all << self
    end

    def self.all
        @@all
    end

    def add_boating_test(name, status, instructor)
        BoatingTest.new(self, name, status, instructor)
    end

    def self.find_student
    end

    def student_tests
        BoatingTest.all.select do |bt| 
         student == self 
        end
    end

    def passed_tests
        student_tests.select do |bt|
        bt.status == "passed"
      end
    end

    def grade_percentage       
        anwser = passed_tests.count/student_tests.count
        anwser.to_f * 100
    end 


end
