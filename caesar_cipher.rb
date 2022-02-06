def letter?(character)
  character.match?(/[A-Za-z]/) && character.length == 1
end

def capital?(letter)
  return letter == letter.upcase
end

def caesar_cipher_single_letter_downcase(letter, shift)
  distance_to_zero = "a".ord
  return ((((letter.ord-distance_to_zero)+shift)%26)+distance_to_zero).chr
end

def caesar_cipher_single_letter_upcase(letter, shift)
  distance_to_zero = "A".ord
  return ((((letter.ord-distance_to_zero)+shift)%26)+distance_to_zero).chr
end

def caesar_cipher_single_letter(letter,shift)
  if letter?(letter)
    if capital?(letter)
      return caesar_cipher_single_letter_upcase(letter,shift)
    else
      return caesar_cipher_single_letter_downcase(letter,shift)
    end
  else
    return letter
  end
end

def caesar_cipher(message, shift)
  if message.instance_of?(String)
    if shift.instance_of?(Integer)
      encrypted_message = message[0,message.length]
      for index in (0...message.length) do
        encrypted_message[index] = caesar_cipher_single_letter(encrypted_message[index],shift)
      end
      return encrypted_message
    else
      puts("Error: No integer was entered.")
      return nil
    end
  else
    puts("Error: No string was entered.")
    return nil
  end
end



