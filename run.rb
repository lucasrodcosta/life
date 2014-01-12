height = 35
width = 70

ambient = Ambient.new(height, width)
90.times do |i|
  ambient.insert_cell( Cell.new, Random.rand(height), Random.rand(width) )
end

def run(ambient)
  100.times do |i|
    system('clear')
    puts ambient.to_s
    sleep 0.3
    ambient.cells.each do |cell|
      cell.move
    end
  end
end

run(ambient)