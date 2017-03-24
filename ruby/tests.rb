song = <<-HEREDOC
There was an old lady who swallowed a fly.
I don't know why she swallowed a fly - perhaps she'll die!

There was an old lady who swallowed a spider;
That wriggled and wiggled and tickled inside her.
She swallowed the spider to catch the fly;
I don't know why she swallowed a fly - perhaps she'll die!

There was an old lady who swallowed a bird;
How absurd to swallow a bird.
She swallowed the bird to catch the spider,
She swallowed the spider to catch the fly;
I don't know why she swallowed a fly - perhaps she'll die!

There was an old lady who swallowed a cat;
Fancy that to swallow a cat!
She swallowed the cat to catch the bird,
She swallowed the bird to catch the spider,
She swallowed the spider to catch the fly;
I don't know why she swallowed a fly - perhaps she'll die!

There was an old lady who swallowed a dog;
What a hog, to swallow a dog!
She swallowed the dog to catch the cat,
She swallowed the cat to catch the bird,
She swallowed the bird to catch the spider,
She swallowed the spider to catch the fly;
I don't know why she swallowed a fly - perhaps she'll die!

There was an old lady who swallowed a cow;
I don't know how she swallowed a cow!
She swallowed the cow to catch the dog,
She swallowed the dog to catch the cat,
She swallowed the cat to catch the bird,
She swallowed the bird to catch the spider,
She swallowed the spider to catch the fly;
I don't know why she swallowed a fly - perhaps she'll die!

There was an old lady who swallowed a horse...
...She's dead, of course!
HEREDOC

if `ruby song.rb` != song
  puts "Existing behaviour failed"
end

if `ruby song.rb {}` != ""
  puts "0 animal test failed"
end

one_animal_song = <<-HEREDOC
There was an old lady who swallowed a horse...
...She's dead, of course!
HEREDOC

if `ruby song.rb "[ {animal: 'horse', line: '...She\\'s dead, of course!'} ]"` != one_animal_song
  puts "1 animal test failed"
end

two_animals_song = <<-HEREDOC
There was an old lady who swallowed a fly.
I don't know why she swallowed a fly - perhaps she'll die!

There was an old lady who swallowed a horse...
...She's dead, of course!
HEREDOC

if `ruby song.rb "[ {animal: 'fly', line: 'I don\\'t know why she swallowed a fly - perhaps she\\'ll die!'}, {animal: 'horse', line: '...She\\'s dead, of course!'} ]"` != two_animals_song
  puts "2 animal test failed"
end

three_animals_song = <<-HEREDOC
There was an old lady who swallowed a fly.
I don't know why she swallowed a fly - perhaps she'll die!

There was an old lady who swallowed a spider;
That wriggled and wiggled and tickled inside her.
She swallowed the spider to catch the fly;
I don't know why she swallowed a fly - perhaps she'll die!

There was an old lady who swallowed a horse...
...She's dead, of course!
HEREDOC

if `ruby song.rb "[ {animal: 'fly', line: 'I don\\'t know why she swallowed a fly - perhaps she\\'ll die!'}, {animal: 'spider', line: 'That wriggled and wiggled and tickled inside her.'}, {animal: 'horse', line: '...She\\'s dead, of course!'} ]"` != three_animals_song
  puts "3 animal test failed"
end
