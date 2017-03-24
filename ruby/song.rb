require "byebug"

def sing_verse(stanza, delimiter)
  puts "There was an old lady who swallowed a #{stanza[:animal]}#{delimiter}"
  puts stanza[:line]
end

def sing_song(stanzas)
  unless stanzas.empty?
    stanzas[0..-2].each do |stanza|
      sing_verse(stanza, ".")
      puts ""
    end
    sing_verse(stanzas.last, "...")
  end
end

if ARGV.empty?
  puts `ruby song_legacy.rb`
else
  sing_song(eval(ARGV[0]))
end
