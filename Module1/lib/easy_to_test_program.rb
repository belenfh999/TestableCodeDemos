module Module1
  class EasyToTestProgram
    def program(parts, service, discount)
      total = parts + service - discount
      puts "Total price: $#{total}"
      total
    end
  end
end