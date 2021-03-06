//
//  iCaptchaViewController.swift
//  iCaptcha
//
//  Created by Andy Steinmann on 8/16/16.
//  Copyright © 2016 Andy Steinmann. All rights reserved.
//

import Foundation
class iCaptchaViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var cancel_Button: UIButton!
    @IBOutlet var reload_Button: UIButton!
    @IBOutlet var submit_Button: UIButton!

    @IBOutlet var captcha_Field: UITextField!
    @IBOutlet var error_Label: UILabel!
    @IBOutlet var captcha_Label: UILabel!
    @IBOutlet var containerView: UIView!

    var captcha: String!

    var completion: (success: Bool) -> () = { _ in }

    override func viewDidLoad() {
        super.viewDidLoad()

        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        // always fill the view
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]

        view.backgroundColor = UIColor.clearColor()
        view.insertSubview(blurEffectView, belowSubview: self.containerView)

        containerView.layer.cornerRadius = 5;
        containerView.layer.borderWidth = 1;
        containerView.layer.borderColor = UIColor.darkGrayColor().CGColor

        containerView.layer.shadowColor = UIColor.blackColor().CGColor
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowOffset = CGSizeZero
        containerView.layer.shadowRadius = 10

        cancel_Button.layer.cornerRadius = 5;
        reload_Button.layer.cornerRadius = 5;
        submit_Button.layer.cornerRadius = 5;

        reload_captcha()

    }

    @IBAction func cancel_Action(id: UIButton) {
        completion(success: false)
    }

    @IBAction func reload_Action(id: UIButton) {
        reload_captcha()
    }

    @IBAction func submit_Action(id: UIButton) {
        error_Label.text = ""

        if captcha_Field.text?.caseInsensitiveCompare(captcha) == .OrderedSame {
            completion(success: true)
        }
        else {
            error_Label.text = "Failed"
        }
    }

    private func reload_captcha() {

        let hue = Double(arc4random() % 256) / 256.0 // 0.0 to 1.0
        let saturation = (Double(arc4random() % 128) / 256.0) + 0.5 // 0.5 to 1.0, away from white
        let brightness = (Double(arc4random() % 128) / 256.0) + 0.5 // 0.5 to 1.0, away from black
        let color = UIColor(hue: CGFloat(hue), saturation: CGFloat(saturation), brightness: CGFloat(brightness), alpha: 1)

        captcha_Label.backgroundColor = color

        var chars = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

        let charsCount = UInt(chars.count)

        let i1 = UInt(arc4random()) % charsCount
        let i2 = UInt(arc4random()) % charsCount
        let i3 = UInt(arc4random()) % charsCount
        let i4 = UInt(arc4random()) % charsCount
        let i5 = UInt(arc4random()) % charsCount

        captcha = "\(chars[Int(i1)])\(chars[Int(i2)])\(chars[Int(i3)])\(chars[Int(i4)])\(chars[Int(i5)])"

        captcha_Label.text = captcha
        captcha_Field.becomeFirstResponder()
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        submit_Action(submit_Button)
        return true
    }
}
