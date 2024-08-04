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
    
    let specialCharacters: [String] = [   "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "_", "=", "+",
                                          "[", "]", "{", "}", "\\", "|", ";", ":", "'", "\"", ",", ".", "<", ">",
                                          "/", "?", "`", "~", "§", "±", "•", "∞", "¶", "€", "£", "¥", "©", "®", "™"      ]
    
    var cellTitle: String?
    
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var encodeBtn: UIButton!
    
    @IBOutlet var decodeBtn: UIButton!
    
    @IBOutlet var textView: UITextView!
    
    @IBOutlet var textHeightConstraint: NSLayoutConstraint!
    
    var yourChoice: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = cellTitle
        
        encodeBtn.layer.cornerRadius = 15
        decodeBtn.layer.cornerRadius = 15
    }
    
    
    @IBAction func encodeButtonTapped(_ sender: Any) {
        implementation(typeOfCipher: cellTitle!, yourChoice: "encode")
    }
    

    @IBAction func decodeButtonTapped(_ sender: Any) {
        implementation(typeOfCipher: cellTitle!, yourChoice: "decode")
    }
    
    
    func implementation(typeOfCipher: String, yourChoice: String) {
        if typeOfCipher == "Caesar Cipher" {
            caesarCipher(yourChoice: yourChoice)
        } else if typeOfCipher == "Vigener Cipher" {
        }
    }
    
    func caesarCipher(yourChoice: String) {
        var wordArray: [String] = []
        var sentence: String = ""
        var num: Int = 0
        let enteredString = textField.text
        let words = enteredString!.split(separator: "")
        for word in words {
            let instances = word.split(separator: "")
            var instanceNumber = 0
            for instance in instances {
                if alphabets.contains(String(instance)) {
                    num = (yourChoice == "encode") ? 46 : 6
                    instanceNumber = alphabets.firstIndex(of: String(instance))!
                    if instanceNumber < num {
                        wordArray.append(alphabets[num == 46 ? instanceNumber + 6 : instanceNumber + 46])
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
    
    func vinegere(yourChoice: String) {
        
    }
        
    
        
}
