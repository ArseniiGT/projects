# frozen_string_literal: true

# lb7_2.rb
# class Word
class Word
  def initialize(aaa = '')
    (@this = aaa.to_s).gsub!(/\s.+/, '')
  end

  def all_info
    puts "Объект класса #{self.class.name} содержит поля:"
    puts "  Слово:#{@this.class.name}='#{@this}'"
  end

  def print
    puts @this
  end

  def size
    @this.size
  end

  def word
    @this.clone
  end
end

# class Word2
class Word2 < Word
  def initialize(aaa = '')
    super(aaa)
    @length = @this.to_s.size
  end

  def size
    @length
  end

  def all_info
    super
    puts "  Длина:#{@length.class.name}=#{@length}"
  end

  def count_of_vowels
    @this.count 'eyuioaуеыаоэяию'
  end
end
