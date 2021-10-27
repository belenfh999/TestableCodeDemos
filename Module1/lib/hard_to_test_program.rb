module Module1
  class HardToTestProgram
    def program
      parts = $stdin.gets

      service = $stdin.gets

      discount = $stdin.gets

      total = parts.to_f + service.to_f - discount.to_f

      puts "Total Price: $#{total}"
    end
  end
  p = HardToTestProgram.new
  p.program
end