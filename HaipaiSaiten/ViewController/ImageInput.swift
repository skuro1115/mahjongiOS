//
//  ImageInput.swift
//  HaipaiSaiten
//
//  Created by 黒田拓杜 on 2022/08/08.
//

import Foundation
import UIKit

class ImageInputVC: UIViewController{
    
    @IBOutlet weak var ImageInputB: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        gradVertical(view: view, reds: 25, greens: 160, blues: 0, rede: 20, greene: 80, bluee: 0)
        ImageInputB.addTarget(self, action: #selector(tappedImageInputB), for: .touchUpInside)
        
    }
    private func setUpView(){
        ImageInputB.setTitle("スクリーンショットを選択", for: .normal)
        ImageInputB.tintColor = UIColor.white
    }
    @objc func tappedImageInputB(){
        let imagePciker = UIImagePickerController()
        imagePciker.delegate = self
        imagePciker.allowsEditing = true
        present(imagePciker, animated: true, completion: nil)
    
    }
    
}

extension ImageInputVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage{
            let image = editedImage.withRenderingMode(.alwaysOriginal)
            ImageInputB.setImage(image, for: .normal)
            print(image.size.width, image.size.height)
                  
            print("edit")
            
        }else if let originalImage = info[.originalImage] as? UIImage{
            ImageInputB.setImage(originalImage.withRenderingMode(.alwaysOriginal), for: .normal)
            print("original")
        }
        ImageInputB.setTitle("", for: .normal)
        ImageInputB.imageView?.contentMode = .scaleAspectFill
        ImageInputB.contentHorizontalAlignment = .fill
        ImageInputB.contentVerticalAlignment = .fill
        ImageInputB.clipsToBounds = true
        dismiss(animated: true)
    }
}


