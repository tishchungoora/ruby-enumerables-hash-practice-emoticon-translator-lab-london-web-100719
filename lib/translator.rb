require 'yaml'

def load_library(file_path)
  
  # Load the appropriate yaml file of emoticons
  emoticons_hash = YAML.load_file('./lib/emoticons.yml')
  
  # Define a backbone hash for reorganising the emoticons by language
  emoticons_by_lang = {
    :get_meaning => {}, 
    :get_emoticon => {}
  }
  
  # Visit each key-value pair in emoticons_hash to construct emoticons_by_lang
  emoticons_hash.each do |meaning, emoticons|
    emoticons_by_lang[:get_meaning] = emoticons_by_lang[:get_meaning].merge({emoticons[1] => meaning})
    emoticons_by_lang[:get_emoticon] = emoticons_by_lang[:get_emoticon].merge({emoticons[0] => emoticons[1]})
  end
  emoticons_by_lang
end

def get_japanese_emoticon(file_path, eng_emoticon)
  emoticons_by_lang = load_library(file_path)
  message = "Sorry, your emoticon could not be found!"
  emoticon_pairs = emoticons_by_lang[:get_emoticon]
  jap_emoticon = ""
  
  emoticon_pairs.each do |eng_emoticon, jap_emoticon|
    if emoticon_pairs.include?(eng_emoticon)
      jap_emoticon = emoticon_pairs[eng_emoticon]
    end
  end
  jap_emoticon
end

def get_english_meaning
  # code goes here
end

new_hash2 = {
  "angel" => ["O:)", "☜(⌒▽⌒)☞"],
  "angry" => [">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
  "bored" => [":O", "(ΘεΘ;)"]
}

new_hash2 = {
  "angel" => ["A", "Alpha"],
  "angry" => ["B", "Bravo"],
  "bored" => ["C", "Charlie"]
}

