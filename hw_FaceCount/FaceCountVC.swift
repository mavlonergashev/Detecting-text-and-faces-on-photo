//
//  FaceCountVC.swift
//  hw_FaceCount
//
//  Created by Mavlon on 29/03/22.
//

import UIKit

class FaceCountVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var resultStackView: UIStackView!
    @IBOutlet weak var chooseBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        resultStackView.isHidden = true
        
    }
    
    @IBAction func detectFacesBtnPressed(_ sender: Any) {
        
    }
    
    @IBAction func choosePhotoBtnPressed(_ sender: Any) {
 
        //Getting Image From Gallery
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
}


//MARK: - Image Picker -

extension FaceCountVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.editedImage] as? UIImage else {
            print("No Image found")
            return
        }
        imageView.image = image
        dismiss(animated: true, completion: nil)
        
        //Setting Choose Photo Btn title whether checking there is photo or not
        if imageView.image != nil {
            chooseBtn.setTitle("", for: .normal)
        } else {
            chooseBtn.setTitle("Choose Photo", for: .normal)
        }
    }
    
}
