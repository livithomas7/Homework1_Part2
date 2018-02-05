module FunWithStrings
  def palindrome?
    str = self.downcase.gsub(/\W/,'')
    str == str.reverse
  end
  
  def count_words
    word = Hash.new(0)
    self.downcase.gsub(/[^a-z\s]/, '').split.each do |s|
     word[s] += 1
    end
      word
  end
  
  def anagram_groups
    self.downcase.split.group_by { |x| x.chars.sort }.values
  end
end  

class String
  include FunWithStrings
end

