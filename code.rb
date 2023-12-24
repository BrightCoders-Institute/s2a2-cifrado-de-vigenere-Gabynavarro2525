def cifrar(cadena, clave)
    abc = 'abcdefghijklmnñopqrstuvwxyz '
    cadena_cifrar = ''
    i = 0
    cadena.each_char do |letra|
      suma = abc.index(letra) + abc.index(clave[i % clave.length])
      modulo = suma % abc.length
      cadena_cifrar += abc[modulo]
      i += 1
    end
  
    texto_cifrado = "includes/texto_cifrado.txt"
    File.open(texto_cifrado, 'w+') { |archivo| archivo.write(cadena_cifrar) }
    
    return "Por favor, busca el texto cifrado en la siguiente ruta: /includes/texto_cifrado.txt"
  end
  
  def descifrar(cadena, clave)
      abc = 'abcdefghijklmnñopqrstuvwxyz '
    cadena_descifrar = ''
    i = 0
    cadena.each_char do |letra|
      suma = abc.index(letra) - abc.index(clave[i % clave.length])
      modulo = suma % abc.length
      cadena_descifrar += abc[modulo]
      i += 1
    end
  
    File.delete('includes/texto_cifrado.txt') if File.exist?('includes/texto_cifrado.txt')
    return cadena_descifrar
  end
  
  def main
   
    loop do
      puts "|--------------|"
      puts "|  1 Cifrar    |"
      puts "|  2 Descifrar |"
      puts "|  3 Salir     |"
      puts "|--------------|"
      
      print "Ingrese opcion: "
      opt = gets.chomp.to_i
  
      case opt
      when 1
        print 'Texto a cifrar: '
        cadena = gets.chomp.downcase
        print 'Clave: '
        clave = gets.chomp.downcase
        puts cifrar(cadena, clave)
      when 2
        print 'Texto a Descifrar: '
        cadena = gets.chomp.downcase
        print 'Clave: '
        clave = gets.chomp.downcase
        puts descifrar(cadena, clave)
      when 3
        break
      else
        puts 'Opción no válida. Intente de nuevo.'
      end
    end
  end