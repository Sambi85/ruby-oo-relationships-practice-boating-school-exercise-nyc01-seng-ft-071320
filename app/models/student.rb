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

    def self.find_student(name)
        self.all.find do |student|
            student.name == name
        end
    end

    def student_tests
        BoatingTest.all.select do |bt| 
         bt.student == self 
        end
    end

    def passed_tests
        student_tests.select do |bt|
        bt.status == "passed"
      end
    end

    def grade_percentage       
        passed = self.passed_tests.count
        all_tests = self.student_tests.count

        answer = passed.to_f / all_tests.to_f
        
        answer * 100
    end 


end
