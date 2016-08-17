//
//  ViewController.swift
//  iCaptchaSample
//
//  Created by Andy Steinmann on 8/16/16.
//  Copyright © 2016 Andy Steinmann. All rights reserved.
//

import UIKit
import iCaptcha

class ViewController: UIViewController {
    var vc: UIViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        vc = iCaptcha.load()
        // self.view.addSubview(vc.view)
        vc.modalPresentationStyle = .OverCurrentContext
        vc.modalTransitionStyle = .CrossDissolve
        self.presentViewController(vc, animated: true, completion: nil)
    }
}

