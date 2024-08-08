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
                                          "/", "?", "`", "~", "§", "±", "•", "∞", "¶", "€", "£", "¥", "©", "®", "™"      ]
    
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
        
        view.backgroundColor = .white
        title = cellTitle
        
        if cellTitle! == "Caesar Cipher" {
            cipherTextField.placeholder = "Enter Shift Value"
        } else if cellTitle! == "Vigenere Cipher" {
            cipherTextField.placeholder = "Cipher Key"
        } else if cellTitle! == "Polyalphabetic Cipher" {
            cipherTextField.isHidden = true
            
            textFieldBgView.translatesAutoresizingMaskIntoConstraints = false
                self.view.addSubview(textFieldBgView)
                
                // Add constraints
                NSLayoutConstraint.activate([
                    // Top constraint: 40 points below the safe area
                    textFieldBgView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40),
                    
                    // Left and Right constraints: 0 points from the edges
                    textFieldBgView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
                    textFieldBgView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
                    
                    // Height constraint: 60 points
                    textFieldBgView.heightAnchor.constraint(equalToConstant: 60)
                ])
            
    
                
//            textFieldBgView.frame.size.height = 200
//            textFieldBgView.constraints.
//            textFieldBgView.frame.size.height = 60
//            print(textFieldBgView.frame.height)
        }
        
        encodeBtn.layer.cornerRadius = 15
        decodeBtn.layer.cornerRadius = 15
    }
    
    
    @IBAction func encodeButtonTapped(_ sender: Any) {
        if cellTitle! == "Caesar Cipher" {
            implementation(typeOfCipher: cellTitle!, yourChoice: "encode")
        } else if cellTitle! == "Vigenere Cipher" {
            implementation(typeOfCipher: cellTitle!, yourChoice: "encode")
        } else if cellTitle! == "Polyalphabetic Cipher" {
            implementation(typeOfCipher: cellTitle!, yourChoice: "encode")
        }
    }
    

    @IBAction func decodeButtonTapped(_ sender: Any) {
        if cellTitle! == "Caesar Cipher" {
            implementation(typeOfCipher: cellTitle!, yourChoice: "decode")
        } else if cellTitle! == "Vigenere Cipher" {
            implementation(typeOfCipher: cellTitle!, yourChoice: "decode")
        } else if cellTitle! == "Polyalphabetic Cipher" {
            implementation(typeOfCipher: cellTitle!, yourChoice: "decode")
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
//        cipherTextField.placeholder = "Enter Shift Value"
        let totalNoOfAlphabets = 52
        let shiftValue = Int(cipherTextField.text!)
        

        
        let numEntered = shiftValue! * 2
        let minusedNum = totalNoOfAlphabets - numEntered
        var wordArray: [String] = []
        var sentence: String = ""
        var num: Int = 0
        let enteredString = textField.text
        let words = enteredString!.split(separator: "")
        if shiftValue! == 0 || shiftValue! > 25 {
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
    
    
    
    func vigenereCipher(yourChoice: String) {
//        cipherTextField.placeholder = "Cipher Key"
        var myDict: [String: [String]] = [:]
        var allLetters: [String] = []
        var index: Int = 0
        let cipher = cipherTextField.text!
        var cipheredText = ""
        let enteredString = textField.text
        
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
        
//        let myDictOrdered = myDict.sorted { $0.key < $1.key }
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
                print("Key: \(char) not found in dictionary.")
            }
            number += 1
        }

        let encodedAnswer = String(answerString)
        var decodedString: [Character] = []
        var count = encodedAnswer.count
        let enteredStringArray = Array(enteredString!)
        var numberForDecoded = 0
        // to decode
        for char in cipheredText {
          if let value = myDict[String(char)] {
                let num = value.firstIndex(of: String(enteredStringArray[numberForDecoded]))
                let dictLetter = alphabet[num!]
                decodedString.append(Character(dictLetter))
                numberForDecoded += 1
            } else {
                print("Key: \(char) not found in dictionary.")
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
    
    
    
    func polyalphabeticCipher(yourChoice: String) {

        let array1: [Character] = ["m", "q", "a", "f", "p", "b", "z", "c", "h", "n", "d", "g", "r", "l", "t", "o", "e", "x", "w", "y", "j", "k", "s", "u", "v", "i"]
        let array2: [Character] = ["g", "h", "w", "r", "j", "c", "o", "e", "s", "f", "a", "l", "m", "n", "p", "t", "u", "v", "x", "y", "i", "d", "k", "q", "b", "z"]
        let array3: [Character] = ["l", "d", "k", "w", "b", "y", "z", "t", "q", "i", "p", "x", "e", "c", "f", "h", "a", "u", "m", "n", "r", "v", "j", "o", "s", "g"]

        let enteredString: String = textField.text!

        let enteredTextArray = Array(enteredString)

        print(enteredTextArray)

        var answerArray: [Character] = []

        var isNext = 0
        
        var forDecode = 0

        for char in enteredTextArray {
          let indexNumber = alphabet.firstIndex(of: String(char))
          if isNext == 0 {
            answerArray.append(array1[indexNumber!])
            isNext = 1
            forDecode = 0
          } else if isNext == 1 {
            answerArray.append(array2[indexNumber!])
            isNext = 2
            forDecode = 1
          } else if isNext == 2 {
            answerArray.append(array3[indexNumber!])
            isNext = 0
            forDecode = 2
          }
          print(indexNumber!)
        }

        var encodedAnswer = String(answerArray)

        var decodeArray: [Character] = []

        for char in answerArray {

          if forDecode == 2 {
            let indexNumber = array3.firstIndex(of: char)
            decodeArray.append(Character(alphabet[indexNumber!]))
//            isNext = 1
              forDecode = 1
          } else if forDecode == 1 {let indexNumber = array2.firstIndex(of: char)
            decodeArray.append(Character(alphabet[indexNumber!]))
//            isNext = 2
              forDecode = 2
          } else if forDecode == 0 {
            let indexNumber = array1.firstIndex(of: char)
            decodeArray.append(Character(alphabet[indexNumber!]))
//            isNext = 0
              forDecode = 0
          }
        }

        var decodedAnswer = String(decodeArray)

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
