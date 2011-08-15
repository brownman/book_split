
module BookSplit
class FileLoader
  attr_accessor :file 

  def initialize file_name
    @file = File.open file_name
  end

  def get_string
    str = ""
    while  line = @file.gets
      str << line
    end
    str
  end
end


class Splitter

  def self.split str , symbols
   
      arr = []
    symbols.each do
      |symbol|
      str = str.gsub "#{symbol}" , "#{symbol}\n"


    end

      arr = str.split "\n"
    arr 
  end
end



class Story 
  attr_accessor :story_str,
    :file_name

  def initialize 
    @story_str = ""

  end

  def add file_name
    file = FileLoader.new file_name
    @story_str =  file.get_string
  end


  def divide symbols 
    story_arr = Splitter.split @story_str , symbols
    story_arr
  end
end

class Reader 
  attr_accessor :story, :column , :symbols

  def initialize
   @story = []
   @symbols = []
    @column = []
  end

  def add_story file_name 

    story = Story.new
    
    story.add file_name
    @story.push story 


    puts "we have #{@story.length} stories so far!"
  end
  
  def update_symbols sym
    @symbols.push sym 
  end

  def create 
    @column = []
    @story.each do |story| 
    divided =  story.divide @symbols 
    @column.push divided
    end
  end
end

end

