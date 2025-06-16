//
//  LoadView.swift
//  HaipaiSaiten
//
//  Created by 黒田拓杜 on 2022/08/09.
//

import Foundation
import UIKit

class LoadingView: UIView {
    override init(frame: CGRect){
        super.init(frame: frame)
        loadNib()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    func loadNib(){
        let view = Bundle.main.loadNibNamed("LoadingView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    
    public func addLoadingView(vc: UIViewController) {
        self.frame = vc.view.frame
        vc.view.addSubview(self)
    }
    public func removeLoadingView() {
        self.removeFromSuperview()
    }
}
