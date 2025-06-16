//
//  ResultVC.swift
//  Haipai_Saiten
//
//  Created by 黒田拓杜 on 2022/03/22.
//

import Foundation
import  UIKit
import GoogleMobileAds

class Yaku{
    
    
    private let nameList = [
        "chitoitsu": "七対子",
        "pinfu": "平和",
        "richi": "立直",
        "tanyao": "断么",
        "ipeko": "一盃口",
        "honitsu": "混一色",
        "jikaze": "役牌 自風",
        "bakaze": "役牌 場風",
        "bakaze18": "役牌 場風",
        "kokushi": "国士無双",
        "chinitsu": "清一色",
        "haku": "役牌 白",
        "hatsu": "役牌 發",
        "chun": "役牌 中",
        "sanshoku": "三色同順",
        "ittsu": "一気通貫",
        "toitoi": "対々和",
        "chanta": "混全帯幺九",
        "junchan": "純全帯幺九",
        "sananko": "三暗刻",
        "honroto": "混老頭",
        "shosangen": "小三元",
        
        "daisangen": "大三元",
        "suanko": "四暗刻",
        "ryanpeko": "二盃口",
        
    ]
    private let han23 = [
        "chitoitsu",
//        "honitsu",
        "ittsu",
        "sanshoku",
        "chanta",
        "sananko",
        
        "toitoi",
        
    ]
    private let han3 = [
        "honitsu",
        "junchan",
        "ryanpeko"
        
    ]
    private let han4 = [
        "honroto",
        "shosangen",
        "chinitsu",
    ]
    private let yakuman = [
        "kokushi",
        "daisangen",
        "suanko",
        
    ]
    
    let name:String
    let kakuritsu: Double
    var color: UIColor
    
    init(romajiName:String, kakuritsu: Double){
        self.name = self.nameList[romajiName] ?? "error"
        self.kakuritsu = kakuritsu
        self.color = UIColor.white
        if han23.contains(romajiName) {
            self.color = UIColor.yellow
        }
        if han3.contains(romajiName) {
            self.color = UIColor.orange
        }
        if han4.contains(romajiName) {
            self.color = UIColor.red
        }
        if yakuman.contains(romajiName) {
            self.color = UIColor.rgb(red: 255, green: 0, blue: 255)
//            self.color = UIColor.red
        }
        
    }
}

class ResultVC:UIViewController{
    
    let isHiddenAd = false
    
    let ryukyokuRitsu = 0.14
    
    static var kakuritsu = 0.0
    static var tensu = 0.0
    static var yakuKakuritsu:[String:Double] = [:]
    
    static var isRareHaipia = false
    @IBOutlet weak var rareMessageL: UILabel!
    
//    @IBOutlet weak var hensachiL: UILabel!
    @IBOutlet weak var yakuTV: UITableView!
    @IBOutlet weak var bannerView2: GADBannerView!
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var kakuritsuL: UILabel!
    @IBOutlet weak var tensuL: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        
        if let id1 = adUnitID(key: "resultBanner1") {

            bannerView.adUnitID = id1
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
            
        }
        if let id2 = adUnitID(key: "resultBanner2") {

            bannerView2.adUnitID = id2
            bannerView2.rootViewController = self
            bannerView2.load(GADRequest())
        }

        func adUnitID(key: String) -> String? {
            guard let adUnitIDs = Bundle.main.object(forInfoDictionaryKey: "AdUnitIDs") as? [String: String] else {
                return nil
            }
            return adUnitIDs[key]
        }
        
        
        yakuTV.delegate = self
        yakuTV.dataSource = self
        loadYakuList()
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presentingViewController?.beginAppearanceTransition(false, animated: animated)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentingViewController?.endAppearanceTransition()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presentingViewController?.beginAppearanceTransition(true, animated: animated)
        presentingViewController?.endAppearanceTransition()
    }
    
    private func setUpView(){
        rareMessageL.isHidden = !ResultVC.isRareHaipia
        rareMessageL.textColor = .red
        gradVertical(view: view, reds: 25, greens: 160, blues: 0, rede: 20, greene: 80, bluee: 0)
        bannerView.isHidden = ISHIDDENAD
        bannerView2.isHidden = ISHIDDENAD
        
//        let heikinAgariRitsu = (1-ryukyokuRitsu)/4
        let heikinsitten = -1386.70
        
        let p = ResultVC.kakuritsu * ResultVC.tensu + (1-ResultVC.kakuritsu) * heikinsitten
        let hensachi = 50.0 + p/3199.28 * 10
        
//        hensachiL.text = String(floor(hensachi*10)/10)
        
        let kakuritsu = floor(ResultVC.kakuritsu*1000)/10
        kakuritsuL.text = String(kakuritsu) + "%"
        let tensu = Int(floor(ResultVC.tensu/10)*10)
        tensuL.text = String(tensu )+"点"
    }
    
    private var yakuList:[Yaku] = []
    
    private func loadYakuList(){
        yakuList = []
        ResultVC.yakuKakuritsu.forEach { (key, value) in
            let yaku = Yaku(romajiName: key, kakuritsu: value)
            yakuList.append(yaku)
        }
        yakuList.sort { y1, y2 in
            return y1.kakuritsu > y2.kakuritsu
        }
        yakuTV.reloadData()
    }
    
}

extension ResultVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ResultVC.yakuKakuritsu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = yakuTV.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! yakuTVCell
        let yaku = yakuList[indexPath.row]
        cell.nameL.text = yaku.name
        cell.nameL.textColor = yaku.color
        cell.kakuritsuL.text = String(floor(yaku.kakuritsu*1000)/10) + "%"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    
}

class yakuTVCell: UITableViewCell{
    
    @IBOutlet weak var nameL: UILabel!
    
    @IBOutlet weak var kakuritsuL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
