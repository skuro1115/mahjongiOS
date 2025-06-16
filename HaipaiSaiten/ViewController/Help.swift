//
//  Help.swift
//  HaipaiSaiten
//
//  Created by 黒田拓杜 on 2022/07/27.
//

import Foundation
import UIKit

class HelpVC: UIViewController{
    
    @IBOutlet weak var textView: UITextView!
    
    let text = "　ダウンロードありがとうございます。\n\n　このアプリではあなたの配牌の和了り確率及び平均得点を、1000万局以上のデータを学習したAIが計算します。\n\n　極端に珍しい配牌については学習データの中に類似データが十分にない可能性があるため、精度を保証しません。\n現実的な配牌に対して精度の高い値を計算します。\n\n　対応ルールは以下の通りです。\n\n・4人麻雀\n・一発裏あり\n・喰いタン後付けあり\n・赤ドラ1枚づつ\n\n\n　二盃口、三色同刻、役満の一部については、学習データ内に十分量の和了データがないため、現時点では対応していません。\n\n\n　今後、様々な機能を増やしていくつもりですので、応援よろしくお願いします。\n\n質問、ご要望等ございましたら公式ツイッター\nID: haipai_checker\nURL: https://twitter.com/haipai_checker\nまでご連絡お願いします。"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradVertical(view: view, reds: 25, greens: 160, blues: 0, rede: 20, greene: 80, bluee: 0)
        textView.text = text
        self.textView.isEditable = false
        self.textView.isSelectable = false
    }
    
}
