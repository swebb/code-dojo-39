require "byebug"

def sing_verse(stanzas, delimiter)
  if stanzas.length == 1
    puts "There was an old lady who swallowed a #{stanzas.last[:animal]}#{delimiter}"
    puts stanzas.last[:line]
  else
    puts "There was an old lady who swallowed a #{stanzas.last[:animal]};"
    puts stanzas.last[:line]
    lines = (1..stanzas.length-1).reverse_each.map do |index|
      "She swallowed the #{stanzas[index][:animal]} to catch the #{stanzas[index-1][:animal]}"
    end
    puts "#{lines.join(",\n")};"
    puts stanzas.first[:line]
  end
end

def sing_song(stanzas)
  unless stanzas.empty?
    (0..stanzas.length-2).each do |index|
      sing_verse(stanzas.slice(0..index), ".")
      puts ""
    end
    sing_verse([stanzas.last], "...")
  end
end

if ARGV.empty?
  puts `ruby song_legacy.rb`
else
  sing_song(eval(ARGV[0]))
end
