module Words
  class NotImplementedRangeError < StandardError; end
  
  class NumToWords

    UNITS = %w(cero uno dos tres cuatro cinco seis siete ocho nueve)
    UNTIL30 = %w(diez once doce trece catorce quince dieciseis diecisiete dieciocho diecinueve veinte)
    TENS = %w(treinta cuarenta cincuenta sesenta setenta ochenta noventa)
    HUNDREDS = %w(ciento doscientos trescientos cuatrocientos quinientos seiscientos setecientos ochocientos novecientos)
    MILES = %w(mil millones billones)

    FUNCTIONS = {
                  0..9 => :units,
                  10..29 => :until30,
                  30..99 => :tens,
                  100..999 => :hundreds,
                  1000..999_999_999_999 => :millions  
                }

    attr_accessor :num

    def initialize(num)
      @num = num
    end

    def perform
      raise NotImplementedRangeError if num > 999_999_999_999
      check(num)
    end

    private 
    
    def check(num)
      function = FUNCTIONS.select { |range| range === num }.values.first 
      self.send(function, num)
    end

    def units(num)
      UNITS[num]
    end

    def until30(num)
      special = "veinti"
      div, mod = num.divmod(10)
      num > 20 ? "#{special}#{UNITS[mod]}" : UNTIL30[mod]
    end

    def tens(num)
      div, mod = num.divmod(10)
      "#{TENS[div-3]}" + (mod.zero? ? "" : " y #{UNITS[mod]}")
    end

    def hundreds(num)
      div, mod = num.divmod(100)
      "#{HUNDREDS[div-1]}" + (mod.zero? ? "" : " #{check(mod)}")
    end

    def millions(num)
      groups = num.to_s.chars.reverse.each_slice(3).map { |arr| arr.join.reverse.to_i}.reverse
      result = ""
      last = "#{check(groups.pop)}"

      groups.each_with_index do |elem, i|
        result += "#{check(elem)} #{MILES[(groups.size - 1) - i]} "
      end

      result + last
    end
  end

  def to_words
    num_to_w = NumToWords.new(self)
    num_to_w.perform
  end
end

class Fixnum
  include Words
end

def num_to_words(num)
  num.to_words
end