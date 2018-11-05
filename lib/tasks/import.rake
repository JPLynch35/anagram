namespace :import do
  desc "Import data from txt file"
  task txt: :environment do 
    pbar = ProgressBar.create(:title => 'of Words', :total => (File.open('data/dictionary.txt')).readlines.size, :format => "%a %bᗧ%i %p%% %t", :progress_mark  => ' ', :remainder_mark => "\u{FF65}", :starting_at => 0)
    File.open('data/dictionary.txt', "r").each_line do |line|
      pbar.increment
      anagram = Anagram.find_or_create_by(sorted_spelling: line.chomp.chars.sort.join)
      anagram.words.create(spelling: line.chomp)
    end
    puts "Total Words: #{Word.count}"
  end
end
