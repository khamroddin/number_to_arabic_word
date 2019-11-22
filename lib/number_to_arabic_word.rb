require "number_to_arabic_word/version"

module NumberToArabicWord
  class Error < StandardError; end
  # Your code goes here...
  def self.process(num)
    # TODO: process `str`
    composite_num = num.to_i.to_s
    case composite_num.length.to_s
      when "1"
        return convert_one_digits(composite_num)
      when "2"
        return convert_two_digits(composite_num)
      when "3"
        return convert_three_digits(composite_num)
      when "4"
        return convert_four_digits(composite_num)
      when "5"
        return convert_five_digits(composite_num)
      when "6"
        return convert_six_digits(composite_num)
    end
  end
  def self.convert_one_digits(number)
    alpha = ''
    case number.to_s
      when "1"
        alpha = "واحد"
      when "2"
        alpha = "إثنان"
      when "3"
        alpha = "ثلاثه"
      when "4"
        alpha = "أربعه"
      when "5"
        alpha = "خمسه"
      when "6"
        alpha = "سته"
      when "7"
        alpha = "سبعه"
      when "8"
        alpha = "ثمانيه"
      when "9"
        alpha = "تسعه"
    end
    return alpha
  end
  def self.convert_two_digits(decimal_factor)
    return_alpha = "00"
    if decimal_factor.to_s[0,1].to_s == '0' and decimal_factor.to_s[1,1].to_s == '1'
      convert_one_digits(decimal_factor.to_s[1,1])
    else
      case decimal_factor.to_s[0,1].to_s
        when "1"
          if decimal_factor.to_s[1,1].to_s == '1'
            return "إحدى عشر"
          elsif decimal_factor.to_s[1,1].to_s == '2'
            return "إثنى عشر"
          else
            return convert_one_digits(decimal_factor.to_s[1,1].to_s) + " " + "عشر"
          end
        when "2"
          return_alpha = "عشرون"
        when "3"
          return_alpha = "ثلاثون"
        when "4"
          return_alpha = "أربعون"
        when "5"
          return_alpha = "خمسون"
        when "6"
          return_alpha = "ستون"
        when "7"
          return_alpha = "سبعون"
        when "8"
          return_alpha = "ثمانون"
        when "9"
          return_alpha = "تسعون"
      end
    end
    if ((convert_one_digits(decimal_factor.to_s[1,1].to_s)).length == 0)
      return return_alpha
    else
      return_alpha =  convert_one_digits(decimal_factor.to_s[1,1].to_s) + " و " + return_alpha
    end
    return return_alpha
  end
  def self.convert_three_digits(decimal_factor)
    return_alpha = ''
    case decimal_factor.to_s[0,1].to_i
      when 1
        if (decimal_factor.to_s[1,1].to_s == '0')
          if (decimal_factor.to_s[2,1].to_s == '0')
            return_alpha = "مائه"
          else
            return ("مائه" + " و " + convert_one_digits(decimal_factor.to_s[2,1].to_s))
          end
        else
          return ("مائه" + " و " + convert_two_digits(decimal_factor.to_s[1, 3]))
        end

      when 2
        if (decimal_factor.to_s[1,1].to_s == '0')
          if (decimal_factor.to_s[2,1].to_s == '0')
            return "مائتين"
          else
            return ("مائتين" + " و "  + convert_one_digits(decimal_factor.to_s[2,1].to_s))
          end
        else
          return ("مائتين" + " و "   + convert_two_digits(decimal_factor.to_s[1, 3]))
        end
      when 3..9
        if (decimal_factor.to_s[1,1].to_s == '0')
          if (decimal_factor.to_s[2,1].to_s == '0')
            return (convert_one_digits(decimal_factor.to_s[0,1])  + " مائه " )
          else
            return (convert_one_digits(decimal_factor[0,1]).to_s  + " مائه " + " و "    +  convert_one_digits(decimal_factor[0,1]).to_s)
          end
        else
          return  (convert_one_digits(decimal_factor[0,1]).to_s  + " مائه " + " و "  + convert_two_digits(decimal_factor[1,3]).to_s)
        end
      when 0
        if (decimal_factor.to_s[1,1].to_s == '0')
          if (decimal_factor.to_s[2,1].to_s == '0')
            return " "
          else
            return convert_one_digits(decimal_factor.to_s[2,1].to_s)
          end
        else
          return convert_two_digits(decimal_factor[1,3].to_s)
        end
    end
    return return_alpha
  end
  def self.convert_four_digits(decimal_factor)
    return_alpha = ''
    case decimal_factor.to_s[0,1].to_i
      when 1
        if (decimal_factor.to_s[1,1].to_s == '0')
          if (decimal_factor.to_s[2,1].to_s == '0')
            if (decimal_factor.to_s[3,1].to_s == '0')
              return  "ألف"
            else
              return ("ألف" + " و " + convert_one_digits(decimal_factor[3,1]).to_s)
            end
          else
            return ("ألف" + " و " + convert_two_digits(decimal_factor[2, 3]).to_s)
          end
        else
          return ("ألف" + " و " + convert_three_digits(decimal_factor[1, 4]).to_s)
        end

      when 2
        if (decimal_factor.to_s[1,1].to_s == '0')
          if (decimal_factor.to_s[2,1].to_s == '0')
            if (decimal_factor.to_s[3,1].to_s == '0')
              return "ألفين"
            else
              return "ألفين" + " و " + convert_one_digits(decimal_factor[3,1]).to_s
            end
          else
            return "ألفين" + " و " + convert_two_digits(decimal_factor[2, 3]).to_s
          end
        else
          return  "ألفين" + " و " + convert_three_digits(decimal_factor[1, 4]).to_s
        end
      when 3..9
        if (decimal_factor.to_s[1,1].to_s == '0')
          if (decimal_factor.to_s[2,1].to_s == '0')
            if (decimal_factor.to_s[3,1].to_s == '0')
              return convert_one_digits(decimal_factor[0,1]).to_s + " ألاف"
            else
              return  convert_one_digits(decimal_factor[0,1]).to_s + " ألاف" + " و "  + convert_one_digits(decimal_factor.to_s[3,1]).to_s
            end
          else
            return  convert_one_digits(decimal_factor[0,1]).to_s + " ألاف" + " و " + convert_two_digits(decimal_factor[2, 3]).to_s
          end
        else
          return  convert_one_digits(decimal_factor[0,1]).to_s + " ألاف" + " و " +  convert_three_digits(decimal_factor[1,4]).to_s
        end
    end
  end
  def self.convert_five_digits(decimal_factor)
    if ((convert_three_digits(decimal_factor[2, 5])).length== 0)
      return (convert_two_digits(decimal_factor[0, 2]) + " ألف ")
    else
      return (convert_two_digits(decimal_factor[0, 2]).to_s + " ألفا " + " و " + convert_three_digits(decimal_factor[2, 5]).to_s)
    end
  end
  def self.convert_six_digits(decimal_factor)
    if ((convert_three_digits(decimal_factor[2, 5])).length== 0)
      return (convert_three_digits(decimal_factor[0, 3])  + " ألف ")
    else
      return  (convert_three_digits(decimal_factor[0, 3]) + " ألفا " + " و " +  convert_three_digits(decimal_factor[3, 6]))
    end
  end

end
