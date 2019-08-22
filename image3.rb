class Image

  def initialize(picture)
    @pic = picture
  end

  def output_image
    @pic.each do |item|
      puts item.join
    end

  end

  def blur
    locations = []
    @pic.each_with_index do |row,rowindex|
      #print "row= ",row,"   rowindex=",rowindex,"\n"
      row.each_with_index do |column,columnindex|
        #print "column= ",column,"   columnindex=",columnindex,"\n"
        if column == 1
          locations << [rowindex, columnindex]
        end
      end
    end
#print locations, "\n"

  rmaxindex = @pic.length-1
  cmaxindex = @pic[0].length-1
    locations.each do |r, c|
      if r > 0
         @pic [r-1] [c] = 1    #change value above
      end
      if r < rmaxindex
          @pic [r+1] [c] = 1    #change value below
      end
      if c > 0
          @pic [r] [c-1] = 1    #change value to left
      end
      if c < cmaxindex
          @pic [r] [c+1] = 1    #change value to right
          #print "r= ",r,"  c=",c," \n"
      end
    end
  end

end


image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 1, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0]
])

manhattan_distance = 2
#array = [*1..manhattan_distance]
array = (1..manhattan_distance)
array.each do |something|
  image.blur
end

image.output_image
