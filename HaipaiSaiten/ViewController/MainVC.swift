//
//  ViewController.swift
//  Haipai_Saiten
//
//  Created by 黒田拓杜 on 2022/03/22.
//

import UIKit
import CoreML
import GoogleMobileAds
//import PKHUD

let ISHIDDENAD = false

class Main2VC: UIViewController {
    
    @IBOutlet weak var bannerView: GADBannerView!
    var activityIndicator = UIActivityIndicatorView()

    let isShantenInTought = false
    
    private var jikaze = 99
    private var bakaze = 99

    static var dorahyo = 0
    
    private var shantensu = 4
    
    private var selectedDeleteB = 99{
        didSet{
            isFull = false
            var len = haipai.count
            if (len != 0 && len>selectedDeleteB){
                haipai.remove(at: selectedDeleteB)
                len = haipai.count
                let image = UIImage(named: "hai99.jpg")
                switch len {
                case 0:
                    h1.setImage(image, for: .normal)
                case 1:
                    h2.setImage(image, for: .normal)
                case 2:
                    h3.setImage(image, for: .normal)
                case 3:
                    h4.setImage(image, for: .normal)
                case 4:
                    h5.setImage(image, for: .normal)
                case 5:
                    h6.setImage(image, for: .normal)
                case 6:
                    h7.setImage(image, for: .normal)
                case 7:
                    h8.setImage(image, for: .normal)
                case 8:
                    h9.setImage(image, for: .normal)
                case 9:
                    h10.setImage(image, for: .normal)
                case 10:
                    h11.setImage(image, for: .normal)
                case 11:
                    h12.setImage(image, for: .normal)
                case 12:
                    h13.setImage(image, for: .normal)
                default:
                    break
                }
            }
            if selectedDeleteB == 99  {
                let image = UIImage(named: "hai99.jpg")
                h1.setImage(image, for: .normal)
                h2.setImage(image, for: .normal)
                h3.setImage(image, for: .normal)
                h4.setImage(image, for: .normal)
                h5.setImage(image, for: .normal)
                h6.setImage(image, for: .normal)
                h7.setImage(image, for: .normal)
                h8.setImage(image, for: .normal)
                h9.setImage(image, for: .normal)
                h10.setImage(image, for: .normal)
                h11.setImage(image, for: .normal)
                h12.setImage(image, for: .normal)
                h13.setImage(image, for: .normal)
            }
            
        }
    }
    
    private var isFull = false{
        didSet{
            if isFull{
                saitenB.isEnabled = true
            }else{
                saitenB.isEnabled = false
            }
        }
    }
    private var haipai:[Int]=[]{
        didSet{
            let len = haipai.count
            if len == 13{
                let visuablehaipai = makeHailistForCulcShanten(haipaiVec: haipai)
                let shanten = calcShanten(haiList: visuablehaipai)
                shantensu = shanten
                if shanten != 0{
                    shantenL.text = String(shanten) + "向聴"
                }else{
                    shantenL.text = "テンパイ"
                }
            }else{
                shantenL.text = ""
            }
            for i in 0..<len{
                let haiID = haipai[i]
                
                
                var haiNumber = haiID/4
                if haiID == 16{
                    haiNumber = 36
                }else if haiID == 52{
                    haiNumber = 37
                }else if haiID == 88{
                    haiNumber = 38
                }
                var imageUrl = "hai" + String(haiNumber)+".jpg"
                imageUrl = Asset.ImageName(haiNumber: haiNumber) + ".png"
                
                let image = UIImage(named: imageUrl)
                switch i {
                case 0:
                    h1.setImage(image, for: .normal)
                case 1:
                    h2.setImage(image, for: .normal)
                case 2:
                    h3.setImage(image, for: .normal)
                case 3:
                    h4.setImage(image, for: .normal)
                case 4:
                    h5.setImage(image, for: .normal)
                case 5:
                    h6.setImage(image, for: .normal)
                case 6:
                    h7.setImage(image, for: .normal)
                case 7:
                    h8.setImage(image, for: .normal)
                case 8:
                    h9.setImage(image, for: .normal)
                case 9:
                    h10.setImage(image, for: .normal)
                case 10:
                    h11.setImage(image, for: .normal)
                case 11:
                    h12.setImage(image, for: .normal)
                case 12:
                    h13.setImage(image, for: .normal)
                    self.isFull = true
                default:
                    break
                    
                }
                
            }
        }
    }
    
    @IBAction func goToHelpB(_ sender: Any) {
        modalView(storyboard: "Help", ID: "HelpVC")
        
    }
    private var selectedhaiID = 999{
        didSet{
            
            if !isFull && countElementInList(list: haipai, ele: selectedhaiID) < 4 {
                haipai.append(selectedhaiID)
                haipai.sort()
            }
            
        }
    }
    private func countElementInList(list:[Int],ele:Int)->Int{
        var count = 0
        list.forEach { element in
            if element == ele{
                count += 1
            }
        }
        return count
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
    
    @IBAction func akam5(_ sender: Any) {
        selectedhaiID = 4*4
    }
    
    
    @IBAction func akap5(_ sender: Any) {
        selectedhaiID = 13*4
    }
    
    @IBAction func akas5(_ sender: Any) {
        selectedhaiID = 22*4
    }
    
    
    
    @IBOutlet weak var h1: UIButton!
    
    @IBOutlet weak var h2: UIButton!
    
    @IBOutlet weak var h3: UIButton!
    
    @IBOutlet weak var h4: UIButton!
    
    @IBOutlet weak var h5: UIButton!
    @IBOutlet weak var h6: UIButton!
    @IBOutlet weak var h7: UIButton!
    
    @IBOutlet weak var h8: UIButton!

    @IBOutlet weak var h9: UIButton!
    @IBOutlet weak var h10: UIButton!
    
    @IBOutlet weak var h11: UIButton!
    
    @IBOutlet weak var h12: UIButton!
    @IBOutlet weak var h13: UIButton!
    
    @IBOutlet weak var resetB: UIButton!
    @objc func taph1(){
        selectedDeleteB = 0
    }
    @objc func taph2(){
        selectedDeleteB = 1
    }
    @objc func taph3(){
        selectedDeleteB = 2
    }
    @objc func taph4(){
        selectedDeleteB = 3
    }
    @objc func taph5(){
        selectedDeleteB = 4
    }
    @objc func taph6(){
        selectedDeleteB = 5
    }
    @objc func taph7(){
        selectedDeleteB = 6
    }
    @objc func taph8(){
        selectedDeleteB = 7
    }
    @objc func taph9(){
        selectedDeleteB = 8
    }
    @objc func taph10(){
        selectedDeleteB = 9
    }
    @objc func taph11(){
        selectedDeleteB = 10
    }
    @objc func taph12(){
        selectedDeleteB = 11
    }
    @objc func taph13(){
        selectedDeleteB = 12
    }
    
    
    
    @IBOutlet weak var saitenB: UIButton!
    
    @IBAction func saitenB(_ sender: Any) {
        
        if bakaze == 99{
            failedAlert(sentence: "場風を設定してください")
            return
        }
        if jikaze == 99{
            failedAlert(sentence: "自風を設定してください")
            return
        }
        ResultVC.isRareHaipia = false
        saitenB.setTitle("計算中...", for: .normal)
//        HUD.show(.labeledProgress(title: "計算中です", subtitle: nil))

//        activityIndicator.startAnimating()
        
        
        DispatchQueue.global().async { [self] in
            let inputVec = self.self.makeInputVectorFromHaipai(haipai: self.haipai, bakaze: self.bakaze, jikaze: self.jikaze)

            self.calcAgariKakuritsu(haipai: inputVec)
            self.calcTensu(haipai: inputVec)
            self.calcYaku(haipai: inputVec)
            DispatchQueue.main.async {
//                self.activityIndicator.stopAnimating()
//                HUD.hide()
                self.modalView(storyboard: "Result", ID: "ResultVC")

            }
        }
        
        
        
        


    }
    
    
    @IBOutlet weak var ba_tonB: UIButton!
    
    @IBOutlet weak var ba_nanB: UIButton!
    
    @IBOutlet weak var ji_tonB: UIButton!
        
    @IBOutlet weak var ji_nanB: UIButton!
    
    @IBOutlet weak var ji_shaB: UIButton!
    
    @IBOutlet weak var ji_peiB: UIButton!
    
    
    @objc func tappedBaTonB(){

        ba_tonB.layer.borderColor = UIColor.white.cgColor
        ba_nanB.layer.borderColor = UIColor.clear.cgColor
        bakaze = 0
        
    }
    @objc func tappedBaNanB(){
        ba_tonB.layer.borderColor = UIColor.clear.cgColor
        ba_nanB.layer.borderColor = UIColor.white.cgColor
        bakaze=1
        
        
    }
    @objc func tappedJiTonB(){
        ji_tonB.layer.borderColor = UIColor.white.cgColor
        ji_nanB.layer.borderColor = UIColor.clear.cgColor
        ji_shaB.layer.borderColor = UIColor.clear.cgColor
        ji_peiB.layer.borderColor = UIColor.clear.cgColor
        jikaze = 0
    }
    @objc func tappedJiNanB(){
        ji_tonB.layer.borderColor = UIColor.clear.cgColor
        ji_nanB.layer.borderColor = UIColor.white.cgColor
        ji_shaB.layer.borderColor = UIColor.clear.cgColor
        ji_peiB.layer.borderColor = UIColor.clear.cgColor
        jikaze = 1
    }
    @objc func tappedJiShaB(){
        ji_tonB.layer.borderColor = UIColor.clear.cgColor
        ji_nanB.layer.borderColor = UIColor.clear.cgColor
        ji_shaB.layer.borderColor = UIColor.white.cgColor
        ji_peiB.layer.borderColor = UIColor.clear.cgColor
        jikaze = 2
    }
    @objc func tappedJiPeiB(){
        ji_tonB.layer.borderColor = UIColor.clear.cgColor
        ji_nanB.layer.borderColor = UIColor.clear.cgColor
        ji_shaB.layer.borderColor = UIColor.clear.cgColor
        ji_peiB.layer.borderColor = UIColor.white.cgColor
        jikaze = 3
    }
    
    @IBOutlet weak var dorahyoB: UIButton!
    @IBAction func selectDorahyoB(_ sender: Any) {
        modalView(storyboard: "SelectDorahyo", ID: "SelectDorahyoVC")
    }
    
    
    @IBAction func resetB(_ sender: Any) {
        selectedDeleteB = 99
        haipai = []

    }
    
    @IBAction func randomHaipaiB(_ sender: Any) {
        
        var random = makeRandomHaipai()
        random.sort()
        jikaze = Int(arc4random_uniform(UInt32(4)))
        bakaze = Int(arc4random_uniform(UInt32(2)))

        haipai = random
        
        switch jikaze{
        case 0:
            ji_tonB.layer.borderColor = UIColor.white.cgColor
            ji_nanB.layer.borderColor = UIColor.clear.cgColor
            ji_shaB.layer.borderColor = UIColor.clear.cgColor
            ji_peiB.layer.borderColor = UIColor.clear.cgColor
        case 1:
            ji_tonB.layer.borderColor = UIColor.clear.cgColor
            ji_nanB.layer.borderColor = UIColor.white.cgColor
            ji_shaB.layer.borderColor = UIColor.clear.cgColor
            ji_peiB.layer.borderColor = UIColor.clear.cgColor
        case 2:
            ji_tonB.layer.borderColor = UIColor.clear.cgColor
            ji_nanB.layer.borderColor = UIColor.clear.cgColor
            ji_shaB.layer.borderColor = UIColor.white.cgColor
            ji_peiB.layer.borderColor = UIColor.clear.cgColor
        case 3:
            ji_tonB.layer.borderColor = UIColor.clear.cgColor
            ji_nanB.layer.borderColor = UIColor.clear.cgColor
            ji_shaB.layer.borderColor = UIColor.clear.cgColor
            ji_peiB.layer.borderColor = UIColor.white.cgColor
        default:
            break
        }
        switch bakaze{
        case 0:
            ba_tonB.layer.borderColor = UIColor.white.cgColor
            ba_nanB.layer.borderColor = UIColor.clear.cgColor
        case 1:
            ba_tonB.layer.borderColor = UIColor.clear.cgColor
            ba_nanB.layer.borderColor = UIColor.white.cgColor
        default:
            break
        }
        Main2VC.dorahyo = Int(arc4random_uniform(UInt32(4*34)))
        let haiNumber = Main2VC.dorahyo/4
        let imageUrl = Asset.ImageName(haiNumber: haiNumber) + ".png"
        let image = UIImage(named: imageUrl)
        dorahyoB.setImage(image, for: .normal)
        
        
    }
    @IBOutlet weak var shantenL: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpAction()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("viewWillAppear")
        saitenB.setTitle("計算!!", for: .normal)

        
        let haiNumber = Main2VC.dorahyo/4
        let imageUrl = Asset.ImageName(haiNumber: haiNumber) + ".png"
        let image = UIImage(named: imageUrl)
                dorahyoB.setImage(image, for: .normal)
        
        if let id = adUnitID(key: "banner") {

            bannerView.adUnitID = id
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
        }

        func adUnitID(key: String) -> String? {
            guard let adUnitIDs = Bundle.main.object(forInfoDictionaryKey: "AdUnitIDs") as? [String: String] else {
                return nil
            }
            return adUnitIDs[key]
        }
        
    }
    
    private func setUpView(){

        bannerView.isHidden = ISHIDDENAD
        
        ba_tonB.layer.cornerRadius = 10
        ba_nanB.layer.cornerRadius = 10
        
        ji_tonB.layer.cornerRadius = 8
        ji_nanB.layer.cornerRadius = 8
        ji_shaB.layer.cornerRadius = 8
        ji_peiB.layer.cornerRadius = 8
        
        ba_tonB.layer.borderWidth = 2
        ba_nanB.layer.borderWidth = 2
        
        ji_tonB.layer.borderWidth = 2
        ji_nanB.layer.borderWidth = 2
        ji_shaB.layer.borderWidth = 2
        ji_peiB.layer.borderWidth = 2
        
        ba_tonB.layer.borderColor = UIColor.clear.cgColor
        ba_nanB.layer.borderColor = UIColor.clear.cgColor
        
        ji_tonB.layer.borderColor = UIColor.clear.cgColor
        ji_nanB.layer.borderColor = UIColor.clear.cgColor
        ji_shaB.layer.borderColor = UIColor.clear.cgColor
        ji_peiB.layer.borderColor = UIColor.clear.cgColor
        
        
        resetB.layer.cornerRadius = 3
//        resetB.backgroundColor = .rgb(red: 25, green: 100, blue: 0)
        resetB.layer.borderColor = UIColor.white.cgColor
        resetB.layer.borderWidth = 1
        gradVertical(view: view, reds: 25, greens: 160, blues: 0, rede: 20, greene: 80, bluee: 0)
//        gradiationAndShadow(view: saitenB, red: 255, green: 216, blue: 101)
        addShadow(view: saitenB)
        saitenB.layer.cornerRadius = 7
        saitenB.layer.borderWidth = 3
        saitenB.layer.borderColor = UIColor.white.cgColor
        self.activityIndicator = UIActivityIndicatorView(style: .large)
        self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.activityIndicator.color = .darkGray
        self.view.addSubview(self.activityIndicator)
        
        self.activityIndicator.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.activityIndicator.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.activityIndicator.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.activityIndicator.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    private func setUpAction(){
        saitenB.isEnabled = false

        ba_tonB.addTarget(self, action: #selector(tappedBaTonB), for: .touchUpInside)
        ba_nanB.addTarget(self, action: #selector(tappedBaNanB), for: .touchUpInside)
        ji_tonB.addTarget(self, action: #selector(tappedJiTonB), for: .touchUpInside)
        ji_nanB.addTarget(self, action: #selector(tappedJiNanB), for: .touchUpInside)
        ji_shaB.addTarget(self, action: #selector(tappedJiShaB), for: .touchUpInside)
        ji_peiB.addTarget(self, action: #selector(tappedJiPeiB), for: .touchUpInside)
        h1.addTarget(self, action: #selector(taph1), for: .touchUpInside)
        h2.addTarget(self, action: #selector(taph2), for: .touchUpInside)
        h3.addTarget(self, action: #selector(taph3), for: .touchUpInside)
        h4.addTarget(self, action: #selector(taph4), for: .touchUpInside)
        h5.addTarget(self, action: #selector(taph5), for: .touchUpInside)
        h6.addTarget(self, action: #selector(taph6), for: .touchUpInside)
        h7.addTarget(self, action: #selector(taph7), for: .touchUpInside)
        h8.addTarget(self, action: #selector(taph8), for: .touchUpInside)
        h9.addTarget(self, action: #selector(taph9), for: .touchUpInside)
        h10.addTarget(self, action: #selector(taph10), for: .touchUpInside)
        h11.addTarget(self, action: #selector(taph11), for: .touchUpInside)
        h12.addTarget(self, action: #selector(taph12), for: .touchUpInside)
        h13.addTarget(self, action: #selector(taph13), for: .touchUpInside)

    }
    
    private func calcAgariKakuritsu(haipai:[Int]){

        var inputVec = haipai
        if isShantenInTought{
            
            let model = sample2()
            var shantenVector = [0,0,0,0]
            switch shantensu{
            case 0:
                shantenVector = [1,1,1,1]
            case 1:
                shantenVector = [1,1,1,0]
            case 2:
                shantenVector = [1,1,0,0]
            case 3:
                shantenVector = [1,0,0,0]
            default:
                break
            }
            inputVec = inputVec + shantenVector
//            print(inputVec)
            let inputLenght = inputVec.count
            
            let mlArray = try!MLMultiArray(shape: [inputLenght as NSNumber], dataType: MLMultiArrayDataType.double)
            for i in 0..<inputLenght {
                mlArray[i] = inputVec[i] as NSNumber
            }
            let input = sample2Input.init(input: mlArray)
            let output = try! model.prediction(input: input)
            ResultVC.kakuritsu = Double(truncating: output.var_21[0]  )
        }else{
            let model = sample()
            
            let inputLenght = inputVec.count
            
            let mlArray = try!MLMultiArray(shape: [inputLenght as NSNumber], dataType: MLMultiArrayDataType.double)
            for i in 0..<inputLenght {
                mlArray[i] = inputVec[i] as NSNumber
            }
            let input = sampleInput.init(input: mlArray)
            let output = try! model.prediction(input: input)
            ResultVC.kakuritsu = Double(truncating: output.var_24[0]  )
        }
        
    }
    private func calcTensu(haipai:[Int]){
        let model = tensu()
        let inputVec = haipai
        print(inputVec)
        let mlArray = try!MLMultiArray(shape: [179], dataType: MLMultiArrayDataType.double)
        for i in 0..<179{
            mlArray[i] = inputVec[i] as NSNumber
            
        }
        let input = tensuInput.init(input: mlArray)
        let output = try! model.prediction(input: input)
//        print( Double(output.var_20[0] ))
        ResultVC.tensu = Double(output.var_20[0]  )
    }
    
    private func calcYaku(haipai:[Int]) {
        let chitoitsuModel = chitoitsu()
        
        let inputVec = haipai
  
        let mlArray = try!MLMultiArray(shape: [179], dataType: MLMultiArrayDataType.double)
        for i in 0..<179{
            mlArray[i] = inputVec[i] as NSNumber
            
        }
        let input = chitoitsuInput.init(input: mlArray)
        let output = try! chitoitsuModel.prediction(input: input)
        ResultVC.yakuKakuritsu.updateValue(Double(truncating: output.var_21[0]  ), forKey: "chitoitsu")
        
        let richiModel = richi()
        let richiinput = richiInput.init(input: mlArray)
        let richioutput = try! richiModel.prediction(input: richiinput)
        ResultVC.yakuKakuritsu.updateValue(Double(truncating: richioutput.var_21[0]  ), forKey: "richi")
        
        let pinfuModel = pinfu()
        let pinfuinput = pinfuInput.init(input: mlArray)
        let pinfuoutput = try! pinfuModel.prediction(input: pinfuinput)
        ResultVC.yakuKakuritsu.updateValue(Double(truncating: pinfuoutput.var_21[0]  ), forKey: "pinfu")
        
        let tanyaoModel = tanyao()
        let tanyaoinput = tanyaoInput.init(input: mlArray)
        let tanyaooutput = try! tanyaoModel.prediction(input: tanyaoinput)
        ResultVC.yakuKakuritsu.updateValue(Double(truncating: tanyaooutput.var_21[0]  ), forKey: "tanyao")
        
        let ipekoModel = ipeko()
        let ipekoinput = ipekoInput.init(input: mlArray)
        let ipekooutput = try! ipekoModel.prediction(input: ipekoinput)
        ResultVC.yakuKakuritsu.updateValue(Double(truncating: ipekooutput.var_21[0]  ), forKey: "ipeko")
        
        let honitsuModel = honitsu()
        let honitsuinput = honitsuInput.init(input: mlArray)
        let honitsuoutput = try! honitsuModel.prediction(input: honitsuinput)
        ResultVC.yakuKakuritsu.updateValue(Double(truncating: honitsuoutput.var_21[0]  ), forKey: "honitsu")
        
        let jikazeModel = HaipaiSaiten.jikaze()
        let jikazeinput = jikazeInput.init(input: mlArray)
        let jikazeoutput = try! jikazeModel.prediction(input: jikazeinput)
        ResultVC.yakuKakuritsu.updateValue(Double(truncating: jikazeoutput.var_21[0]  ), forKey: "jikaze")
        
//        let bakazeModel = HaipaiSaiten.bakaze()
//        let bakazeinput = bakazeInput.init(input: mlArray)
//        let bakazeoutput = try! bakazeModel.prediction(input: bakazeinput)
//        ResultVC.yakuKakuritsu.updateValue(Double(truncating: bakazeoutput.var_21[0]  ), forKey: "bakaze")
        
        let bakaze18Model = HaipaiSaiten.bakaze18()
        let bakaze18input = bakaze18Input.init(input: mlArray)
        let bakaze18output = try! bakaze18Model.prediction(input: bakaze18input)
        ResultVC.yakuKakuritsu.updateValue(Double(truncating: bakaze18output.var_21[0]  ), forKey: "bakaze18")
        
        let kokushiModel = kokushi()
        let kokushiinput = kokushiInput.init(input: mlArray)
        let kokushioutput = try! kokushiModel.prediction(input: kokushiinput)
        ResultVC.yakuKakuritsu.updateValue(Double(truncating: kokushioutput.var_21[0]  ), forKey: "kokushi")
        
        
        
        
        let chinitsuModel = chinitsu()
        let chinitsuinput = chinitsuInput.init(input: mlArray)
        let chinitsuoutput = try! chinitsuModel.prediction(input: chinitsuinput)
        ResultVC.yakuKakuritsu.updateValue(Double(truncating: chinitsuoutput.var_21[0]  ), forKey: "chinitsu")
        
        let hakuModel = haku()
        let hakuinput = hakuInput.init(input: mlArray)
        let hakuoutput = try! hakuModel.prediction(input: hakuinput)
        ResultVC.yakuKakuritsu.updateValue(Double(truncating: hakuoutput.var_21[0]  ), forKey: "haku")
        
        let hatsuModel = hatsu()
        let hatsuinput = hatsuInput.init(input: mlArray)
        let hatsuoutput = try! hatsuModel.prediction(input: hatsuinput)
        ResultVC.yakuKakuritsu.updateValue(Double(truncating: hatsuoutput.var_21[0]  ), forKey: "hatsu")
        
        let chunModel = chun()
        let chuninput = chunInput.init(input: mlArray)
        let chunoutput = try! chunModel.prediction(input: chuninput)
        ResultVC.yakuKakuritsu.updateValue(Double(truncating: chunoutput.var_21[0]  ), forKey: "chun")
        
        let sanshokuModel = sanshoku()
        let sanshokuinput = sanshokuInput.init(input: mlArray)
        let sanshokuoutput = try! sanshokuModel.prediction(input: sanshokuinput)
        ResultVC.yakuKakuritsu.updateValue(Double(truncating: sanshokuoutput.var_21[0]  ), forKey: "sanshoku")
        
        let ittsuModel = ittsu()
        let ittsuinput = ittsuInput.init(input: mlArray)
        let ittsuoutput = try! ittsuModel.prediction(input: ittsuinput)
        ResultVC.yakuKakuritsu.updateValue(Double(truncating: ittsuoutput.var_21[0]  ), forKey: "ittsu")
        
        let toitoiModel = toitoi()
        let toitoiinput = toitoiInput.init(input: mlArray)
        let toitoioutput = try! toitoiModel.prediction(input: toitoiinput)
        ResultVC.yakuKakuritsu.updateValue(Double(truncating: toitoioutput.var_21[0]  ), forKey: "toitoi")
        
        let chantaModel = chanta()
        let chantainput = chantaInput.init(input: mlArray)
        let chantaoutput = try! chantaModel.prediction(input: chantainput)
        ResultVC.yakuKakuritsu.updateValue(Double(truncating: chantaoutput.var_21[0]  ), forKey: "chanta")
        
        let junchanModel = junchan()
        let junchaninput = junchanInput.init(input: mlArray)
        let junchanoutput = try! junchanModel.prediction(input: junchaninput)
        ResultVC.yakuKakuritsu.updateValue(Double(truncating: junchanoutput.var_21[0]  ), forKey: "junchan")
        
        let honrotoModel = honroto()
        let honrotoinput = honrotoInput.init(input: mlArray)
        let honrotooutput = try! honrotoModel.prediction(input: honrotoinput)
        ResultVC.yakuKakuritsu.updateValue(Double(truncating: honrotooutput.var_21[0]  ), forKey: "honroto")
        
        let sanankoModel = sananko()
        let sanankoinput = sanankoInput.init(input: mlArray)
        let sanankooutput = try! sanankoModel.prediction(input: sanankoinput)
        ResultVC.yakuKakuritsu.updateValue(Double(truncating: sanankooutput.var_21[0]  ), forKey: "sananko")
        
        let shosangenModel = shosangen()
        let shosangeninput = shosangenInput.init(input: mlArray)
        let shosangenoutput = try! shosangenModel.prediction(input: shosangeninput)
        ResultVC.yakuKakuritsu.updateValue(Double(truncating: shosangenoutput.var_21[0]  ), forKey: "shosangen")
        
        let daisangenModel = daisangen()
        let daisangeninput = daisangenInput.init(input: mlArray)
        let daisangenoutput = try! daisangenModel.prediction(input: daisangeninput)
        ResultVC.yakuKakuritsu.updateValue(Double(truncating: daisangenoutput.var_21[0]  ), forKey: "daisangen")
        if Double(truncating: daisangenoutput.var_21[0] ) > 0.5{
            ResultVC.isRareHaipia = true
        }
        
        let suankoModel = suanko()
        let suankoinput = suankoInput.init(input: mlArray)
        let suankooutput = try! suankoModel.prediction(input: suankoinput)
        ResultVC.yakuKakuritsu.updateValue(Double(truncating: suankooutput.var_21[0]  ), forKey: "suanko")
        if Double(truncating: suankooutput.var_21[0] ) > 0.037{
            ResultVC.isRareHaipia = true
        }
        
//        let ryanpekoModel = ryanpeko()
//        let ryanpekoinput = ryanpekoInput.init(input: mlArray)
//        let ryanpekooutput = try! ryanpekoModel.prediction(input: ryanpekoinput)
//        ResultVC.yakuKakuritsu.updateValue(Double(truncating: ryanpekooutput.var_21[0]  ), forKey: "ryanpeko")
//        if Double(truncating: ryanpekooutput.var_21[0] ) > 0.01{
//            ResultVC.isRareHaipia = true
//        }
//
        
    }
    
    
    
    private func makeHailistForCulcShanten(haipaiVec:[Int]) -> [Int]{
        var outList = [Int](repeating: 0, count: 34)
        haipaiVec.forEach { haiID in
            let haiNumber = haiID/4
            outList[haiNumber] += 1
        }
        return outList
    }
    
    
    
    
    private func makeSampleVector(visuableHaipai:[Int]) -> [Int]{
        var sampleHaipai:[Int] = []
        if visuableHaipai.reduce(0, +) != 13{
            print("配牌が13枚じゃありません")
            return []
        }

        for i in 0..<34{
            let haiCount =  visuableHaipai[i]
            for _ in 0..<haiCount{
                sampleHaipai.append(i*4+1)
            }
        }
        return sampleHaipai
    }
    
    
    private func makeInputVectorFromHaipai(haipai:[Int],bakaze:Int,jikaze:Int)->[Int]{
        let akas = [16,52,88]

        var haipaiData:[Int] = []
        for _ in 0..<34{
            haipaiData.append(0)
        }
    
        var akadoraCount = 0
        haipai.forEach { hai in
            let haiNumber = hai/4
            if akas.contains(hai) {
                akadoraCount += 1
            }
            haipaiData[haiNumber] += 1
        }

            

        //#######数牌ベクトルの生成#######
        var haipaiVector:[Int] = []
        for i in 0..<34{
            let haiCount = haipaiData[i]
            var haipaiVectorElement = [0,0,0,0]
            for j in 0..<haiCount{
                haipaiVectorElement[j] = 1
            }
            
            haipaiVector += haipaiVectorElement
        }


//        #######赤ドラベクトルの生成#######
        var akadoraVector = [0,0,0]
        for i in 0..<min(akadoraCount,3){
            akadoraVector[i] = 1
        }
        
//        #######風ベクトルの生成#########
        var bakazeVector = [0,0]
        var jikazeVector = [0,0,0,0]
        bakazeVector[bakaze] = 1
        jikazeVector[jikaze] = 1

        let kazeVector = bakazeVector + jikazeVector

//        #######ドラ表示牌ベクトルの生成######

        let dorahyoNumber = Main2VC.dorahyo/4
        print(dorahyoNumber)
        var dorahyoVector:[Int] = []
        for _ in 0..<34{
            dorahyoVector.append(0)
        }
        dorahyoVector[dorahyoNumber] = 1
        
//        var shantenVector = [0,0,0,0]
//        switch shantensu{
//        case 0:
//            shantenVector = [1,1,1,1]
//        case 1:
//            shantenVector = [1,1,1,0]
//        case 2:
//            shantenVector = [1,1,0,0]
//        case 3:
//            shantenVector = [1,0,0,0]
//        default:
//            break
//        }
        ResultVC.isRareHaipia = isRarehaipai(haipai: haipaiVector)
        let vec = haipaiVector + akadoraVector + kazeVector + dorahyoVector
        return vec
    }
    
    private func isRarehaipai(haipai:[Int]) -> Bool{
        var kantsuCount = 0
        var ankoCount = 0
        for i in 0..<34{
            let j = 4*i + 3
            let a = 4*i + 2
            if haipai[j] == 1{
                kantsuCount += 1
            }
            if haipai[a] == 1{
                ankoCount += 1
            }
        }
        if kantsuCount > 1{
            return true
        }
        if ankoCount > 2{
            return true
        }
        if kantsuCount == 1{
            if shantensu < 2{
                return true
            }
        }
        return false
    }
    
    func makeRandomHaipai() -> [Int]{
        var intArray: [Int]
        intArray = []
        var intset: [Int]
        intset = []
        let Num = 4*34
        
        
        intArray = []
        for i in 1..<Num{
            intArray.append(i)
        }
        //
        for _ in 0..<13{
            let j = Int(arc4random_uniform(UInt32(intArray.count)))
            intset.append(intArray[j])
            intArray.remove(at: j)
        }
        
        return intset
    }
    
}

