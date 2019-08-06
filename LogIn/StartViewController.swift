//
//  StartViewController.swift
//  LogIn
//
//  Created by Anton Kuznetsov on 8/6/19.
//  Copyright © 2019 AntonKuznetsov. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInButton.layer.cornerRadius = 25
    }
}

