//
//  SelectDorahyoVC.swift
//  Haipai_Saiten
//
//  Created by 黒田拓杜 on 2022/03/22.
//

import Foundation
import UIKit

class SelectDorahyoVC: UIViewController {
    var selectedhaiID = 0{
        didSet{
            Main2VC.dorahyo = selectedhaiID
            dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func m1(_ sender: Any) {
        selectedhaiID = 0*4 + 1
    }
    
    @IBAction func m2(_ sender: Any) {
        selectedhaiID = 1*4 + 1
    }
    
    @IBAction func m3(_ sender: Any) {
        selectedhaiID = 2*4 + 1
    }
    
    @IBAction func m4(_ sender: Any) {
        selectedhaiID = 3*4 + 1
    }
    @IBAction func m5(_ sender: Any) {
        selectedhaiID = 4*4 + 1
    }
    
    @IBAction func m6(_ sender: Any) {
        selectedhaiID = 5*4 + 1
    }
    
    @IBAction func m7(_ sender: Any) {
        selectedhaiID = 6*4 + 1
    }
    
    @IBAction func m8(_ sender: Any) {
        selectedhaiID = 7*4 + 1
    }
    
    @IBAction func m9(_ sender: Any) {
        selectedhaiID = 8*4 + 1
    }
    
    @IBAction func p1(_ sender: Any) {
        selectedhaiID = 9*4 + 1
    }
    
    @IBAction func p2(_ sender: Any) {
        selectedhaiID = 10*4 + 1
    }
    @IBAction func p3(_ sender: Any) {
        selectedhaiID = 11*4 + 1
    }
    
    @IBAction func p4(_ sender: Any) {
        selectedhaiID = 12*4 + 1
    }
    
    @IBAction func p5(_ sender: Any) {
        selectedhaiID = 13*4 + 1
    }
    
    @IBAction func p6(_ sender: Any) {
        selectedhaiID = 14*4 + 1
    }
    
    
    @IBAction func p7(_ sender: Any) {
        selectedhaiID = 15*4 + 1
    }
    
    @IBAction func p8(_ sender: Any) {
        selectedhaiID = 16*4 + 1
    }
    
    @IBAction func p9(_ sender: Any) {
        selectedhaiID = 17*4 + 1
    }
    @IBAction func s1(_ sender: Any) {
        selectedhaiID = 18*4 + 1
    }
    
    @IBAction func s2(_ sender: Any) {
        selectedhaiID = 19*4 + 1
    }
    @IBAction func s3(_ sender: Any) {
        selectedhaiID = 20*4 + 1
    }
    
    @IBAction func s4(_ sender: Any) {
        selectedhaiID = 21*4 + 1
    }
    
    @IBAction func s5(_ sender: Any) {
        selectedhaiID = 22*4 + 1
    }
    
    @IBAction func s6(_ sender: Any) {
        selectedhaiID = 23*4 + 1
    }
    
    @IBAction func s7(_ sender: Any) {
        selectedhaiID = 24*4 + 1
    }
    
    @IBAction func s8(_ sender: Any) {
        selectedhaiID = 25*4 + 1
    }
    @IBAction func s9(_ sender: Any) {
        selectedhaiID = 26*4 + 1
    }
    @IBAction func e(_ sender: Any) {
        selectedhaiID = 27*4 + 1
    }
    
    @IBAction func s(_ sender: Any) {
        selectedhaiID = 28*4 + 1
    }
    
    @IBAction func w(_ sender: Any) {
        selectedhaiID = 29*4 + 1
    }
    
    @IBAction func n(_ sender: Any) {
        selectedhaiID = 30*4 + 1
    }
    
    @IBAction func wh(_ sender: Any) {
        selectedhaiID = 31*4 + 1
    }
    
    @IBAction func g(_ sender: Any) {
        selectedhaiID = 32*4 + 1
    }
    
    
    @IBAction func r(_ sender: Any) {
        selectedhaiID = 33*4 + 1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.backgroundColor0()
    }
}
