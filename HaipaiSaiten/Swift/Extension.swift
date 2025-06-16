//
//  Extension.swift
//  Haipai_Saiten
//
//  Created by 黒田拓杜 on 2022/03/22.
//

import Foundation
import UIKit

extension UIViewController{
    func pushView(storyboard:String,ID:String) {
        let sb = UIStoryboard(name: storyboard, bundle: nil)
        let view = sb.instantiateViewController(withIdentifier: ID)
        navigationController?.pushViewController(view, animated: true)
    }
    func modalView(storyboard:String,ID:String) {
        let sb = UIStoryboard(name: storyboard, bundle: nil)
        let view = sb.instantiateViewController(withIdentifier: ID)
        present(view, animated: true, completion: nil)
    }
    func failedAlert(sentence:String){
        let alert = UIAlertController(title: sentence, message: "", preferredStyle: UIAlertController.Style.alert)
//        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default){ _ in
        })
        self.present(alert, animated: true, completion: nil)
    }
    func failedAlert(sentence:String,message:String){
        let alert = UIAlertController(title: sentence, message: message, preferredStyle: UIAlertController.Style.alert)
//        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default){ _ in
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    func gradVertical(view:UIView,reds:CGFloat,greens:CGFloat,blues:CGFloat,rede:CGFloat,greene:CGFloat,bluee:CGFloat){
        if view.layer.sublayers?[0] as? CAGradientLayer != nil{
            view.layer.sublayers?.remove(at: 0)
        }

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame =   view.bounds
        gradientLayer.colors = [UIColor(red: reds / 255, green: greens / 255, blue: blues / 255, alpha: 1).cgColor,
                                UIColor(red: rede / 255, green: greene / 255, blue: bluee / 255, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint.init(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 1, y:1)
        gradientLayer.cornerRadius = 5
        view.layer.insertSublayer(gradientLayer, at: 0)
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.6
        view.layer.shadowRadius = 4
    }
    func gradiationAndShadow(view:UIView,red:CGFloat,green:CGFloat,blue:CGFloat){
        if view.layer.sublayers?[0] as? CAGradientLayer != nil{
            view.layer.sublayers?.remove(at: 0)
        }
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame =   view.bounds
        gradientLayer.colors = [UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor,
                                UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint.init(x: 1, y: 1)
        gradientLayer.endPoint = CGPoint.init(x: 0, y:1)
        gradientLayer.cornerRadius = 5
        view.layer.insertSublayer(gradientLayer,at:0)
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.6
        view.layer.shadowRadius = 4
        
    }
    func addShadow(view:UIView){
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 6
        view.layer.shadowRadius = 4
        
    }
}
extension UIColor{
    static func rgb(red: CGFloat, green:CGFloat, blue: CGFloat) -> UIColor{
        return self.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
        
    }
    static func backgroundColor0() -> UIColor {
        return  UIColor.rgb(red: 238, green: 224, blue: 190)

    }
    static func backgroundColor1() -> UIColor {
        return  UIColor.rgb(red: 240, green: 234, blue: 210)

    }
    static func backgroundColor2() -> UIColor {
        return  UIColor.rgb(red: 242, green: 250, blue: 224)

    }
    
    
}



extension UITextField {
    func setUnderLine() {
        // 枠線を非表示にする
        borderStyle = .none
        let underline = UIView()
        // heightにはアンダーラインの高さを入れる
        underline.frame = CGRect(x: 0, y: frame.height, width: frame.width, height: 0.5)
        // 枠線の色
        underline.backgroundColor = .white
        addSubview(underline)
        // 枠線を最前面に
        bringSubviewToFront(underline)
    }

}

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
}



