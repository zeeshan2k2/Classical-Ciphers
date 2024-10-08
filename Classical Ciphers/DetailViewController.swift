//
//  DetailViewController.swift
//  Classical Ciphers
//
//  Created by Zeeshan Waheed on 04/08/2024.
//

import UIKit


class DetailViewController: UIViewController {
    
    let alphabets: [String] = [  "a", "A", "b", "B", "c", "C", "d", "D", "e", "E", "f", "F", "g", "G",
                                 "h", "H", "i", "I", "j", "J", "k", "K", "l", "L", "m", "M", "n", "N",
                                 "o", "O", "p", "P", "q", "Q", "r", "R", "s", "S", "t", "T", "u", "U",
                                 "v", "V", "w", "W", "x", "X", "y", "Y", "z", "Z"                        ]
    
    let Alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S",                       "T", "U", "V", "W", "X", "Y", "Z"]
    
    let alphabet: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q",                              "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    
    let specialCharacters: [String] = [   "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "_", "=", "+",
                                          "[", "]", "{", "}", "\\", "|", ";", ":", "'", "\"", ",", ".", "<", ">",
                                          "/", "?", "`", "~", "§", "±", "•", "∞", "¶", "€", "£", "¥", "©", "®", "™", "\"", " ", "‘", "“", "’", "”" ]
    
    let numbers: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    var cellTitle: String?
    
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var textFieldBgViewUpper: UIView!
    
    @IBOutlet var textFieldBgViewLower: UIView!
    
    @IBOutlet var cipherTextField: UITextField!
    
    @IBOutlet var encodeBtn: UIButton!
    
    @IBOutlet var decodeBtn: UIButton!
    
    @IBOutlet var textView: UITextView!
    
    @IBOutlet var textHeightConstraint: NSLayoutConstraint!
    
    var yourChoice: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = cellTitle
        
        textView.isEditable = false
        
        if cellTitle! == "Caesar Cipher" {
            cipherTextField.keyboardType = .numberPad
            cipherTextField.placeholder = "Enter Shift Value"
        } else if cellTitle! == "Vigenere Cipher" {
            cipherTextField.placeholder = "Cipher Key"
        } else if cellTitle! == "Polyalphabetic Cipher" {
            cipherTextField.isHidden = true
            textFieldBgViewLower.isHidden = true
        } else if cellTitle! == "One-Time Pad Cipher" {
            cipherTextField.isHidden = true
            textFieldBgViewLower.isHidden = true
        } else if cellTitle! == "Playfair Cipher" {
            cipherTextField.placeholder = "Cipher Key"
        } else if cellTitle! == "Rail Fence Cipher" {
            cipherTextField.isHidden = false
            textFieldBgViewLower.isHidden = false
            cipherTextField.placeholder = "Enter Depth Value"
        }
        
        
        textColor(enteredTextField: textField)
        textColor(enteredTextField: cipherTextField)
        
        encodeBtn.layer.cornerRadius = 15
        decodeBtn.layer.cornerRadius = 15
        
        // Create the toolbar and set it up
       let toolbar = UIToolbar()
       toolbar.sizeToFit()
       
       let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
       let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
       toolbar.setItems([flexibleSpace, doneButton], animated: false)
       
       // Assign the toolbar to both text fields
       textField.inputAccessoryView = toolbar
       cipherTextField.inputAccessoryView = toolbar
        
       // Add a tap gesture recognizer to dismiss the keyboard
       let tapGesture = UITapGestureRecognizer(target: self, action: #selector(doneButtonTapped))
       view.addGestureRecognizer(tapGesture)
    }
    
    @objc func doneButtonTapped() {
        textField.resignFirstResponder()
        cipherTextField.resignFirstResponder()
    }

    
    @IBAction func encodeButtonTapped(_ sender: Any) {
        doneButtonTapped()
        if cellTitle! == "Caesar Cipher" {
            implementation(typeOfCipher: cellTitle!, yourChoice: "encode")
        } else if cellTitle! == "Vigenere Cipher" {
            implementation(typeOfCipher: cellTitle!, yourChoice: "encode")
        } else if cellTitle! == "Polyalphabetic Cipher" {
            implementation(typeOfCipher: cellTitle!, yourChoice: "encode")
        } else if cellTitle! == "One-Time Pad Cipher" {
            implementation(typeOfCipher: cellTitle!, yourChoice: "encode")
        } else if cellTitle! == "Playfair Cipher" {
            implementation(typeOfCipher: cellTitle!, yourChoice: "encode")
        } else if cellTitle! == "Rail Fence Cipher" {
            implementation(typeOfCipher: cellTitle!, yourChoice: "encode")
        }
    }
    

    @IBAction func decodeButtonTapped(_ sender: Any) {
        doneButtonTapped()
        if cellTitle! == "Caesar Cipher" {
            implementation(typeOfCipher: cellTitle!, yourChoice: "decode")
        } else if cellTitle! == "Vigenere Cipher" {
            implementation(typeOfCipher: cellTitle!, yourChoice: "decode")
        } else if cellTitle! == "Polyalphabetic Cipher" {
            implementation(typeOfCipher: cellTitle!, yourChoice: "decode")
        } else if cellTitle! == "One-Time Pad Cipher" {
            implementation(typeOfCipher: cellTitle!, yourChoice: "decode")
        } else if cellTitle! == "Playfair Cipher" {
            implementation(typeOfCipher: cellTitle!, yourChoice: "decode")
        } else if cellTitle! == "Rail Fence Cipher" {
            implementation(typeOfCipher: cellTitle!, yourChoice: "decode")
        }
        
    }
    
    
    func textColor(enteredTextField: UITextField) {
        enteredTextField.textColor = UIColor { traitCollection in
            // Check if the user interface style is dark or light
            if traitCollection.userInterfaceStyle == .dark {
                return .white // Color for dark mode
            } else {
                return .black // Color for light mode
            }
        }

    }
    
    func implementation(typeOfCipher: String, yourChoice: String) {
        if typeOfCipher == "Caesar Cipher" {
            caesarCipher(yourChoice: yourChoice)
        } else if typeOfCipher == "Vigenere Cipher" {
            vigenereCipher(yourChoice: yourChoice)
        } else if typeOfCipher == "Polyalphabetic Cipher" {
            polyalphabeticCipher(yourChoice: yourChoice)
        } else if typeOfCipher == "One-Time Pad Cipher" {
            oneTimePadCipher(yourChoice: yourChoice)
        } else if typeOfCipher == "Playfair Cipher" {
            playfairCiphenr(yourChoice: yourChoice)
        } else if typeOfCipher == "Rail Fence Cipher" {
            railFenceCipher(yourChoice: yourChoice)
        }
    }
    
    
    func textViewText(enteredString: String, yourChoice: String, sentence: String) {
        textView.text = """
            This is the entered string:
            \(enteredString)
            
            This is the \(yourChoice == "encode" ? "Encoded": "Decoded") string:
            \(sentence)
            """
    }
    
    
    func caesarCipher(yourChoice: String) {
        
        if textField.text?.isEmpty == true || cipherTextField.text?.isEmpty == true {
            textView.text = "Enter valid input"
        } else {
            
            let totalNoOfAlphabets = 52
            let shiftValue = Int(cipherTextField.text!)
            
            
            let numEntered = shiftValue! * 2
            let minusedNum = totalNoOfAlphabets - numEntered
            var answerArray: [String] = []
            var sentence: String = ""
            var num: Int = 0
            let enteredString = textField.text
            let words = enteredString!.split(separator: "")
            if shiftValue! <= 0 || shiftValue! > 25 {
                textView.text = "Enter a valid shift value between the range 1 - 25"
            } else {
                for word in words {
                    let instances = word.split(separator: "")
                    var instanceNumber = 0
                    for instance in instances {
                        if alphabets.contains(String(instance)) {
                            num = (yourChoice == "encode") ? minusedNum : numEntered
                            instanceNumber = alphabets.firstIndex(of: String(instance))!
                            if instanceNumber < num {
                                answerArray.append(alphabets[num == minusedNum ? instanceNumber + numEntered : instanceNumber + minusedNum])
                            } else if instanceNumber >= num {
                                answerArray.append(alphabets[instanceNumber - num])
                            }
                        } else if specialCharacters.contains(String(instance)) {
                            answerArray.append(String(instance))
                        } else {
                            answerArray.append(String(instance))
                        }
                    }
                }
                
                sentence = answerArray.joined()
                
                textViewText(enteredString: enteredString!, yourChoice: yourChoice, sentence: sentence)
                
            }
        }
        
    }
    
    
    
    
    func vigenereCipher(yourChoice: String) {
        
        if textField.text?.isEmpty == true || cipherTextField.text?.isEmpty == true {
            textView.text = "Enter valid input"
        } else if cipherTextField.text?.contains(where: { $0.isNumber }) == true || cipherTextField.text?.rangeOfCharacter(from: .punctuationCharacters.union(.symbols).union(.punctuationCharacters)) != nil {
            textView.text = "Enter valid cipher key (remove numbers and special characters)"
        } else {
            var myDict: [String: [String]] = [:]
            var allLetters: [String] = []
            var index: Int = 0
            let cipher = cipherTextField.text!.lowercased()
            var cipheredText = ""
            let enteredString = textField.text?.lowercased()
            let enteredString1 = textField.text
            
            var keyIndex = 0
            for i in alphabet {
                index = alphabet.firstIndex(of: i)!
                for letter in alphabet[index...] {
                    allLetters.append(letter)
                }
                index -= 1
                for letter in alphabet[...index] {
                    allLetters.append(letter)
                }
                myDict[i] = allLetters
                allLetters.removeAll()
            }
            
            for character in enteredString! {
                if character == " " || specialCharacters.contains(String(character)) {
                    // Preserve spaces in the extended key
                    cipheredText.append(character)
                } else if Alphabet.contains(String(character)) {
                    cipheredText.append(cipher[cipher.index(cipher.startIndex, offsetBy: keyIndex)])
                    keyIndex = (keyIndex + 1) % cipher.count
                } else {
                    // Append the next character from the key
                    cipheredText.append(cipher[cipher.index(cipher.startIndex, offsetBy: keyIndex)])
                    keyIndex = (keyIndex + 1) % cipher.count
                }
            }
            
            var number = 0
            let characters = Array(cipheredText)
            // Initialize the array to store the results
            var answerString: [Character] = []
            // Iterate over each character in the string
            for char in enteredString! {
                if let value = myDict[String(char)] {
                    let num = alphabet.firstIndex(of: String(characters[number]))
                    let dictLetter = value[num!]
                    answerString.append(Character(dictLetter))
                } else {
                    if let value = myDict[String(char).lowercased()] {
                        let num = alphabet.firstIndex(of: String(characters[number]))
                        let dictLetter = value[num!]
                        answerString.append(Character(dictLetter.uppercased()))
                    } else {
                        answerString.append(char)
                    }
                }
                
                number += 1
                
            }
            print(answerString)
            
            let encodedAnswer = String(answerString)
            var decodedString: [Character] = []
            let enteredStringArray = Array(enteredString!)
            var numberForDecoded = 0
            var num1 = 0
            
            
            print("This is ciphered text \(cipheredText)")
            // to decode
            for char in cipheredText {
                if specialCharacters.contains(String(char)) || String(char) == " " {
                    decodedString.append(char)
                    numberForDecoded += 1
                } else {
                    if let value = myDict[String(char)] {
                        let num = value.firstIndex(of: String(enteredStringArray[numberForDecoded]))
                        if num == nil {
                            decodedString.append(enteredStringArray[num1])
                        } else {
                            let dictLetter = alphabet[num!]
                            decodedString.append(Character(dictLetter))
                            numberForDecoded += 1
                        }
                        
                        num1 += 1
                        
                    } else {
                        print("Key: \(char) not found in dictionary for decoding.")
                    }
                }
            }
            
            let decodedAnswer = String(decodedString)
            print()
            
            var sentence = yourChoice == "encode" ? encodedAnswer: decodedAnswer
            
            // Split both texts into arrays of words using split(separator:)
            let originalWords = enteredString1!.split(separator: " ")
            var newWords = sentence.split(separator: " ")

            // Convert newWords to an array of Strings to allow modification
            var newWordsArray = newWords.map { String($0) }

            // Capitalize words in the new text based on the original text
            for (index, word) in originalWords.enumerated() {
                if word.first?.isUppercase == true {
                    newWordsArray[index] = newWordsArray[index].capitalized
                }
            }

            // Join the words back into a single string
            sentence = newWordsArray.joined(separator: " ")
            
            textViewText(enteredString: enteredString!, yourChoice: yourChoice, sentence: sentence)
        }
        
    }
    
    
    
    
    
    func polyalphabeticCipher(yourChoice: String) {

        let array1: [Character] = ["m", "q", "a", "f", "p", "b", "z", "c", "h", "n", "d", "g", "r", "l", "t", "o", "e", "x", "w", "y", "j", "k", "s", "u", "v", "i"]
        let array2: [Character] = ["g", "h", "w", "r", "j", "c", "o", "e", "s", "f", "a", "l", "m", "n", "p", "t", "u", "v", "x", "y", "i", "d", "k", "q", "b", "z"]
        let array3: [Character] = ["l", "d", "k", "w", "b", "y", "z", "t", "q", "i", "p", "x", "e", "c", "f", "h", "a", "u", "m", "n", "r", "v", "j", "o", "s", "g"]

        let enteredString = textField.text!.lowercased()

        let enteredTextArray = Array(enteredString)

        print("this text entered", enteredString)
        
        print("This is enteredTextArray \(enteredTextArray)")

        var encodeArray: [Character] = []

        var isNext = 0
        
        var forDecode = 0
        
        if textField.text?.isEmpty == true {
            textView.text = "Enter valid input"
        } else {
            for char in enteredTextArray {
                let indexNumber = alphabet.firstIndex(of: String(char))
                if specialCharacters.contains(String(char)) || numbers.contains(String(char)) {
                    encodeArray.append(char)
                    print("found a special char")
                } else {
                    if isNext == 0 {
                        encodeArray.append(array1[indexNumber!])
                        isNext = 1
                    } else if isNext == 1 {
                        encodeArray.append(array2[indexNumber!])
                        isNext = 2
                    } else if isNext == 2 {
                        encodeArray.append(array3[indexNumber!])
                        isNext = 0
                    }
                }
            }
            
            let encodedAnswer = String(encodeArray)
            
            var decodeArray: [Character] = []
            
            for char in enteredTextArray {
                if specialCharacters.contains(String(char)) || numbers.contains(String(char)) {
                    decodeArray.append(char)
                } else {
                    if forDecode == 0 {
                        let indexNumber = array1.firstIndex(of: char)
                        decodeArray.append(Character(alphabet[indexNumber!]))
                        forDecode = 1
                    } else if forDecode == 1 {
                        let indexNumber = array2.firstIndex(of: char)
                        decodeArray.append(Character(alphabet[indexNumber!]))
                        forDecode = 2
                    } else if forDecode == 2 {
                        let indexNumber = array3.firstIndex(of: char)
                        decodeArray.append(Character(alphabet[indexNumber!]))
                        forDecode = 0
                    } else {
                        decodeArray.append(char)
                    }
                }
            }
            
            let decodedAnswer = String(decodeArray)
            
            print("This is the encoded answer: \(encodedAnswer)")
            print()
            print("This is the decoded answer: \(decodedAnswer)")
            
            let sentence = yourChoice == "encode" ? encodedAnswer: decodedAnswer
            
            textViewText(enteredString: enteredString, yourChoice: yourChoice, sentence: sentence)
        }
    }
        
    
    
    
    func oneTimePadCipher(yourChoice: String) {
        
        if textField.text?.isEmpty == true {
            textView.text = "Enter valid input"
        } else {
            let enteredString = textField.text!
        
            let inputASCII = stringToASCII(enteredString)
            let inputLength = inputASCII.count
            
            let key = randomKey(length: inputLength)
            
            let keyAdjusted = adjustKeyToMatchLength(key, toLength: inputLength)
            
            let inputBinary = asciiToBinary(inputASCII)
            let keyBinary = asciiToBinary(keyAdjusted)
            let xorBinary = xorBinaryStrings(inputBinary, keyBinary)
            
            let encodedAnswer = binaryToBase64(xorBinary)
            
            let decryptedBinary = base64ToBinary(encodedAnswer)
            let decryptedBinaryAgain = xorBinaryStrings(decryptedBinary, keyBinary)
            let decodedAnswer = binaryToString(decryptedBinaryAgain)
        
            
            let sentence = yourChoice == "encode" ? encodedAnswer: decodedAnswer
            
            textViewText(enteredString: enteredString, yourChoice: yourChoice, sentence: sentence)
        }

    }
    
    func stringToASCII(_ input: String) -> [UInt8] {
        guard let data = input.data(using: .utf8) else {
            fatalError("Failed to convert string to data")
        }
        return [UInt8](data)
    }

    func asciiToBinary(_ asciiValues: [UInt8]) -> [String] {
        return asciiValues.map { String($0, radix: 2).padLeft(to: 8, with: "0") }
    }

    func binaryToASCII(_ binaryValues: [String]) -> [UInt8] {
        return binaryValues.compactMap { UInt8($0, radix: 2) }
    }

    func xorBinaryStrings(_ binary1: [String], _ binary2: [String]) -> [String] {
        guard binary1.count == binary2.count else {
            fatalError("Binary arrays must be of the same length")
        }
        
        return zip(binary1, binary2).map { (b1, b2) in
            String(zip(b1, b2).map { $0.0 == $0.1 ? "0" : "1" }.joined())
        }
    }

    func binaryToBase64(_ binaryValues: [String]) -> String {
        let asciiValues = binaryToASCII(binaryValues)
        let data = Data(asciiValues)
        return data.base64EncodedString()
    }

    func base64ToBinary(_ base64String: String) -> [String] {
        guard let data = Data(base64Encoded: base64String),
              let asciiValues = [UInt8](data) as? [UInt8] else {
            fatalError("Failed to convert Base64 to data")
        }
        return asciiToBinary(asciiValues)
    }

    func binaryToString(_ binaryValues: [String]) -> String {
        let asciiValues = binaryToASCII(binaryValues)
        let data = Data(asciiValues)
        return String(data: data, encoding: .utf8) ?? "Conversion failed"
    }

    
    func randomKey(length: Int) -> [UInt8] {
        return (0..<length).map { _ in UInt8.random(in: 0...255) }
    }

    func adjustKeyToMatchLength(_ key: [UInt8], toLength length: Int) -> [UInt8] {
        var adjustedKeyBytes = key
        while adjustedKeyBytes.count < length {
            adjustedKeyBytes.append(contentsOf: key)
        }
        if adjustedKeyBytes.count > length {
            adjustedKeyBytes = Array(adjustedKeyBytes.prefix(length))
        }
        return adjustedKeyBytes
    }
    
    
    
    
    
//  Playfair Cipher

    func playfairCiphenr(yourChoice: String) {
        let key = cipherTextField.text ?? ""
        let keySquare = generateKeySquare(key: key)

        let plaintext = textField.text ?? ""
        print("Plaintext: \(plaintext)")

        let encodedAnswer = encrypt(plaintext, using: keySquare)
        print("Encrypted: \(encodedAnswer)")

        var decodedAnswer = decrypt(encodedAnswer, using: keySquare)
        print("Decrypted: \(decodedAnswer)")

        decodedAnswer = formatCiphertext(ciphertext: decodedAnswer, plaintext: plaintext).lowercased()
        print("Formatted Decrypted Text: \(decodedAnswer)")
        
        let sentence = yourChoice == "encode" ? encodedAnswer: decodedAnswer
        
        textViewText(enteredString: plaintext, yourChoice: yourChoice, sentence: sentence)
    }
    
    func generateKeySquare(key: String) -> [[Character]] {
        var key = key.uppercased().replacingOccurrences(of: "J", with: "I")
        var seen = Set<Character>()
        var keyString = ""

        for char in key {
            if char.isLetter && !seen.contains(char) {
                seen.insert(char)
                keyString.append(char)
            }
        }

        for char in Alphabet {
            if !seen.contains(char) {
                keyString.append(char)
            }
        }

        var keySquare: [[Character]] = []
        for i in 0..<5 {
            let start = keyString.index(keyString.startIndex, offsetBy: i * 5)
            let end = keyString.index(start, offsetBy: 4)
            keySquare.append(Array(keyString[start...end]))
        }

        return keySquare
    }

    func prepareText(_ text: String) -> [String] {
        var text = text.uppercased().replacingOccurrences(of: "J", with: "I")
        text = text.filter { $0.isLetter }
        var pairs = [String]()

        var i = 0
        while i < text.count {
            let firstChar = text[text.index(text.startIndex, offsetBy: i)]
            let secondCharIndex = text.index(text.startIndex, offsetBy: i + 1)
            let secondChar = (secondCharIndex < text.endIndex) ? text[secondCharIndex] : "X"

            if firstChar == secondChar {
                pairs.append(String(firstChar) + "X")
                i += 1
            } else {
                pairs.append(String(firstChar) + String(secondChar))
                i += 2
            }
        }

        return pairs
    }

    func findPosition(of char: Character, in keySquare: [[Character]]) -> (Int, Int) {
        for (rowIndex, row) in keySquare.enumerated() {
            if let colIndex = row.firstIndex(of: char) {
                return (rowIndex, colIndex)
            }
        }
        fatalError("Character not found in key square")
    }

    func encryptPair(_ first: Character, _ second: Character, using keySquare: [[Character]]) -> String {
        let (row1, col1) = findPosition(of: first, in: keySquare)
        let (row2, col2) = findPosition(of: second, in: keySquare)

        if row1 == row2 {
            return String(keySquare[row1][(col1 + 1) % 5]) + String(keySquare[row2][(col2 + 1) % 5])
        } else if col1 == col2 {
            return String(keySquare[(row1 + 1) % 5][col1]) + String(keySquare[(row2 + 1) % 5][col2])
        } else {
            return String(keySquare[row1][col2]) + String(keySquare[row2][col1])
        }
    }

    func decryptPair(_ first: Character, _ second: Character, using keySquare: [[Character]]) -> String {
        let (row1, col1) = findPosition(of: first, in: keySquare)
        let (row2, col2) = findPosition(of: second, in: keySquare)

        if row1 == row2 {
            return String(keySquare[row1][(col1 + 4) % 5]) + String(keySquare[row2][(col2 + 4) % 5])
        } else if col1 == col2 {
            return String(keySquare[(row1 + 4) % 5][col1]) + String(keySquare[(row2 + 4) % 5][col2])
        } else {
            return String(keySquare[row1][col2]) + String(keySquare[row2][col1])
        }
    }

    func encrypt(_ text: String, using keySquare: [[Character]]) -> String {
        let textPairs = prepareText(text)
        return textPairs.map { encryptPair($0.first!, $0.last!, using: keySquare) }.joined()
    }

    func decrypt(_ text: String, using keySquare: [[Character]]) -> String {
        let textPairs = stride(from: 0, to: text.count, by: 2).map {
            let startIndex = text.index(text.startIndex, offsetBy: $0)
            let endIndex = text.index(startIndex, offsetBy: 2)
            return String(text[startIndex..<endIndex])
        }

        let decryptedPairs = textPairs.map { decryptPair($0.first!, $0.last!, using: keySquare) }
        let result = decryptedPairs.joined()

        return result.replacingOccurrences(of: "X", with: "").trimmingCharacters(in: .whitespaces)
    }

    func formatCiphertext(ciphertext: String, plaintext: String) -> String {
        let words = plaintext.split(separator: " ")
        var result = ""
        var index = ciphertext.startIndex

        for (i, word) in words.enumerated() {
            let wordLength = word.count
            let endIndex = ciphertext.index(index, offsetBy: wordLength)
            let wordCiphertext = ciphertext[index..<endIndex]

            let formattedWord = String(wordCiphertext).uppercased()
            result += formattedWord
            index = endIndex

            if i < words.count - 1 {
                result += " "
            }
        }
        
        return result
    }
    
    
    
//  rail fence cipher
    func railFenceCipher(yourChoice: String) {
        if textField.text?.isEmpty == true {
            textView.text = "Enter valid input"
        } else {
            var enteredString = textField.text!
            let numberOfRails = Int(cipherTextField.text ?? "2")
            var rails: [[Character]] = Array(repeating: [], count: numberOfRails!)
            
            var isOdd = true
            var currentRail = 0
            
            for letter in enteredString {
                if isOdd {
                    if letter == " " {
                        rails[currentRail].append("-")
                    } else {
                        rails[currentRail].append(letter)
                    }
                    currentRail = (currentRail + 1) % numberOfRails!
                    isOdd = false
                } else {
                    if letter == " " {
                        rails[currentRail].append("-")
                    } else {
                        rails[currentRail].append(letter)
                    }
                    currentRail = (currentRail + 1) % numberOfRails!
                    isOdd = true
                }
            }
            
            let encodedString = rails.flatMap { $0 }.map { String($0) }.joined()
            
            
            for (index, rail) in rails.enumerated() {
                print("Rail \(index + 1): \(String(rail))")
            }
            print("Cipher Text: \(encodedString)")
            
            
            var decodedAnswer: [Character] = []
            var railIndices = Array(repeating: 0, count: numberOfRails!)
            var railLengths = rails.map { $0.count }
            
            
            for i in 0..<enteredString.count {
                let railIndex = i % numberOfRails!
                if railIndices[railIndex] < railLengths[railIndex] {
                    decodedAnswer.append(rails[railIndex][railIndices[railIndex]])
                    railIndices[railIndex] += 1
                }
            }
            
            
            let decodedString = String(decodedAnswer).replacingOccurrences(of: "-", with: " ")
            
            print("Decoded String: \(decodedString)")
            
            let sentence = yourChoice == "encode" ? encodedString: decodedString
            
            textViewText(enteredString: enteredString, yourChoice: yourChoice, sentence: sentence)
        }
    }

}


