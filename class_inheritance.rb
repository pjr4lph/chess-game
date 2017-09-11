class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  attr_accessor :employees

  def initialize(name, title, salary, boss)
    @employees = []
    super
  end

  def bonus(multiplier)
    employee_arr = @employees.dup
    return 0 if employee_arr.empty?
    bonus_total = employee_arr.reduce(0) do |acc, emp|
      if emp.is_a?(Manager)
        acc + emp.bonus(1) + emp.salary
      else
        acc + emp.salary
      end
    end
    bonus_total * multiplier
  end
end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
sharren = Employee.new("Sharren", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

ned.employees = [darren]
darren.employees = [sharren, david]

puts ned.bonus(5)
puts darren.bonus(4)
puts david.bonus(3)
