require_relative './i_printer'
module Module2
  class Printer < IPrinter
    def write_line(text)
      puts text
    end
  end
end
