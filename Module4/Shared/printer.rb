require_relative './i_printer'
require_relative './page_layout'
require 'colorize'
module Module4
  class Printer < IPrinter
    attr_accessor :page_layout

    def set_page_layout(layout)
      @page_layout = layout
    end

    def set_ink_color(color)
      @page_layout.color = color
    end

    def write_line(text)
      color = @page_layout.color
      case color
      when 'red'
        puts "#{text}".colorize(:red)
      else
        puts "#{text}"
      end
    end
  end
end
