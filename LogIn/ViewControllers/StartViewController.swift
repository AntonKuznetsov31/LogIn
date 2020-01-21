//
//  StartViewController.swift
//  LogIn
//
//  Created by Anton Kuznetsov on 1/21/20.
//  Copyright © 2020 AntonKuznetsov. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var signInButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        signInButton.layer.cornerRadius = 25
    }
    
    // MARK: - IBActions
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
    }
}
