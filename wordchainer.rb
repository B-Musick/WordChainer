
require 'byebug'

class WordChainer

    attr_reader :dictionary

    def initialize(dictionary_file_name)
        @dictionary = []
        File.open(dictionary_file_name).each_line {|word| @dictionary << word.chomp}
    end

    def adjacent_words(word)
        # Helper method which returns all words one letter different than current
        # word, same size words as well
        # debugger
        diff_words = []
        word.each_char.with_index do |char,idx|
            # Go through each character of the word so we can find all different words
            # for each letter one letter at a time
            @dictionary.each do |dic_word|
                # Go through all the dictionary words
                if dic_word.length != word.length
                    # If word not equal to the length then skip
                    next
                end

                valid_word = true # Start off the word being a valid word that has only one letter different

                (0...word.length).each do |val|
                    # Check all letters the same except the current indexes that we
                    # have to be the one different letter
                    if val == idx
                        # If at the idx of the letter then check if the same
                        # We want this one to be the current different letter from the original
                        valid_word = false if word[val]==dic_word[val]
                    else
                        # Check that if not the current index, and if the letters
                        # are different from the original, then this word is invalid
                        valid_word = false if word[val]!=dic_word[val]
                    end
                end

                if valid_word
                    # If only one letter difference from original word then good
                    # and we add this to the array holding words with one letter
                    # difference than the original
                    diff_words << dic_word
                end
            end
        end
        diff_words
    end

end

word = WordChainer.new('dictionary.txt')
word.adjacent_words("cat")


