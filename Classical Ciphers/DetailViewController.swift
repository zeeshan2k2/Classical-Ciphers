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
                                 "v", "V", "w", "W", "x", "X", "y", "Y", "z", "Z"                         ]
    
    let alphabet: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q",                              "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    
    let specialCharacters: [String] = [   "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "_", "=", "+",
                                          "[", "]", "{", "}", "\\", "|", ";", ":", "'", "\"", ",", ".", "<", ">",
                                          "/", "?", "`", "~", "§", "±", "•", "∞", "¶", "€", "£", "¥", "©", "®", "™", "\"", " ", "‘", "“", "’", "”" ]
    
    let numbers: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    var cellTitle: String?
    
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var textFieldBgView: UIView!
    
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
        }
    }
    
    func caesarCipher(yourChoice: String) {
        
        if textField.text?.isEmpty == true || cipherTextField.text?.isEmpty == true {
            textView.text = "Enter valid input"
        } else {
            
            let totalNoOfAlphabets = 52
            let shiftValue = Int(cipherTextField.text!)
            
            
            let numEntered = shiftValue! * 2
            let minusedNum = totalNoOfAlphabets - numEntered
            var wordArray: [String] = []
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
                                wordArray.append(alphabets[num == minusedNum ? instanceNumber + numEntered : instanceNumber + minusedNum])
                            } else if instanceNumber >= num {
                                wordArray.append(alphabets[instanceNumber - num])
                            }
                        } else if specialCharacters.contains(String(instance)) {
                            wordArray.append(String(instance))
                        } else {
                            wordArray.append(String(instance))
                        }
                    }
                }
                
                sentence = wordArray.joined()
                
                textView.text = """
                    This is the entered string:
                    \(enteredString!)
                    
                    This is the \(yourChoice == "encode" ? "Encoded": "Decoded") string:
                    \(sentence)
                    """
                
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
                if character == " " {
                    // Preserve spaces in the extended key
                    cipheredText.append(" ")
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
                        answerString.append(char)
                        print("Key: \(char) not found in dictionary for encoding.")
                    }
                    number += 1

            }
            
            let encodedAnswer = String(answerString)
            var decodedString: [Character] = []
            let enteredStringArray = Array(enteredString!)
            var numberForDecoded = 0
            var num1 = 0
            
            // to decode
            for char in cipheredText {
                if specialCharacters.contains(String(char)) {
                    decodedString.append(char)
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
            
            let sentence = yourChoice == "encode" ? encodedAnswer: decodedAnswer
            
            textView.text = """
                This is the entered string:
                \(enteredString!)
                
                This is the \(yourChoice == "encode" ? "Encoded": "Decoded") string:
                \(sentence)
                """
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

        var answerArray: [Character] = []

        var isNext = 0
        
        var forDecode = 0
        
        if textField.text?.isEmpty == true {
            textView.text = "Enter valid input"
        } else {
            for char in enteredTextArray {
                let indexNumber = alphabet.firstIndex(of: String(char))
                if specialCharacters.contains(String(char)) || numbers.contains(String(char)) {
                    answerArray.append(char)
                    print("found a special char")
                } else {
                    if isNext == 0 {
                        answerArray.append(array1[indexNumber!])
                        isNext = 1
                    } else if isNext == 1 {
                        answerArray.append(array2[indexNumber!])
                        isNext = 2
                    } else if isNext == 2 {
                        answerArray.append(array3[indexNumber!])
                        isNext = 0
                    }
                }
            }
            
            let encodedAnswer = String(answerArray)
            
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
            
            textView.text = """
                    This is the entered string:
                    \(enteredString)
                    
                    This is the \(yourChoice == "encode" ? "Encoded": "Decoded") string:
                    \(sentence)
                    """
        }
    }
        
}
