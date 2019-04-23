require 'pry'
instructors = [{name: 'sam', hometown: 'kent', mood: 3}, {name: 'ian', hometown: 'kent', mood: 5}, {name: 'nico', hometown: 'buenos aires?', mood: 7}]

def get_names(instructors)
  instructors.map { |instructor| instructor[:name]}
end

def get_instructors_from_kent(instructors)
  get_instructors_from(instructors, "kent")
end

def get_instructors_from(instructors, hometown)
  instructors.select { |instructor| instructor[:hometown] == hometown }
end

def get_instructor_by_name(instructors, name)
  instructors.find { |instructor| instructor[:name]==name}
end
