#!/usr/bin/env ruby
require "open-uri"
require "json"
require "awesome_print"
require "pp"

module Shanbay
    def format_word(word)
        word = word.strip
        word = word.chomp
        word = word.gsub(/[^A-Za-z\ \-]/,'')
        if word.include?(" ")
            multiWord = word.split()
            word = multiWord.join('%20')
        end
    end
    def shanbayword(word)
        word = format_word word
              
        getworduri = "https://api.shanbay.com/bdc/search/?word=#{word}"
        open( getworduri) do |io|
            jsonstr =  io.read
            my_hash = JSON.parse(jsonstr)
            data = my_hash["data"]
#            cndef = data["cn_definition"]
#            endef = data["en_definition"]
#            word = data["content"]
            #puts word

#            audio = data["us_audio"]

            #puts cndef["defn"]
            #puts endef["defn"]

            #ap data
            return data
            #localmdeid = "/Users/jiyuhang/Documents/Anki/用户1/collection.media/#{word}.mp3"
            #    pid = fork { exec 'wget',audio,'-o',localmdeid }
            #    pid = fork{ exec 'afplay', localmdeid }
        end
    end


    module_function :shanbayword, :format_word
end
