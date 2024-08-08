//
//  ViewController.swift
//  Classical Ciphers
//
//  Created by Zeeshan Waheed on 04/08/2024.
//

import UIKit

class ViewController: UITableViewController {
    
    let typesOfCiphers: [String] = ["Caesar Cipher", "Vigenere Cipher", "Polyalphabetic Cipher"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Classical Ciphers"
        
        // Enable large titles
//        navigationController?.navigationBar.prefersLargeTitles = true
        
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typesOfCiphers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "row", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row+1). \(typesOfCiphers[indexPath.row])"
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier:"Detail") as? DetailViewController {
            vc.cellTitle = typesOfCiphers[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

