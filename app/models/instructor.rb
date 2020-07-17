class Instructor
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        Instructor.all << self
    end

    def self.all
        @@all
    end

    def tests 
        BoatingTest.all.select do |bt|
            bt.instructor == self
        end
    end

    def pass_student(student, test_string)
        #arguments: student object; test name as string
        #if test exists, change status to 'passed'
        #if test doesn't exist, create one with name = test
        # BoatingTest.all.map do |bt|
        #     if bt.name == test_string && bt.student == student && bt.instructor == self
        #         bt.status = 'passed'
        #     elsif bt.name != test_string
        #         BoatingTest.new(student, test_string, 'passed', self)
        #     end
        # end
        #why does the above code create duplicate BoatingTest objects?
        
        test = tests.select do |bt|
            bt.student == student && bt.name == test_string
        end

        if test[0]
            test[0].status = 'passed'
        else
            test = BoatingTest.new(student, test_string, 'passed', self)
        end

        test

    end

    def fail_student(student, test_string)
        test = tests.select do |bt|
            bt.student == student && bt.name == test_string
        end

        if test[0]
            test[0].status = 'failed'
        else
            test = BoatingTest.new(student, test_string, 'failed', self)
        end

        test
    end

end
