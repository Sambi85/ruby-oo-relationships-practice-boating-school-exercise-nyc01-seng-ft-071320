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

    # def tests 
    #     BoatingTest.all.select do |bt|
    #         bt.instructor == self
    #     end
    # end

    def pass_student(test)
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
        #why are we getting duplicates?
        test.status = 'passed'
    end

end
