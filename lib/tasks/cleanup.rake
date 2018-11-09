namespace :cleanup do
  desc "Remove orphaned anagrams"
  task anagrams: :environment do 
    RemovalChronService.new.cleanup_anagrams
  end
end
