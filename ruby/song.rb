require "byebug"

def sing(stanzas)
  stanzas.each do |stanza|
    puts "There was an old lady who swallowed a #{stanza[:animal]}..."
    puts stanza[:line]
  end
end

if ARGV.empty?
  puts `ruby song_legacy.rb`
else
  sing(eval(ARGV[0]))
end
