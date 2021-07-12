//
//  ViewController.swift
//  Music Recognizer
//
//  Created by Gokul Nair on 13/06/21.
//

import UIKit
import ShazamKit

class ViewController: UIViewController, SHSessionDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    private func recognizeSong() {
        // Session
        let session = SHSession()
        // Delegate
        session.delegate = self
        do {
            // Audio -> Buffer
            // SignatureGenerator
            // Create Signaure
            // Try to match
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func session(_ session: SHSession, didFind match: SHMatch) {
        <#code#>
    }
    
    func session(_ session: SHSession, didNotFindMatchFor signature: SHSignature, error: Error?) {
        <#code#>
    }
}




























