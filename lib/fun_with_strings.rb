module FunWithStrings
  def palindrome?
    str = self.downcase.gsub(/\W/,'')
    str == str.reverse
  end
  
  def count_words
    # return a has whose keys are words in the string and whose values
    #are the number of times that word appears
    #str = self.downcase.gsub(/\W/, '')
    
    #word = Hash.new(0)
    #self.downcase.gsub(/[^a-z\s]/, '').split.each do |s|
     #word[s] += 1
    #end
     # word
     
     words = Hash.new

    self.downcase.gsub(/[^a-z\s]/,'').split.each do |w|

      if words[w] != nil
        words[w] += 1
      else
        words[w] = 1
      end
    end
    words
  end
  
  def anagram_groups
    self.downcase.split.group_by { |x| x.chars.sort }.values
  end
end  

class String
  include FunWithStrings
end

