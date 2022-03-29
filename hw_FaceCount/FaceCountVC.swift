//
//  FaceCountVC.swift
//  hw_FaceCount
//
//  Created by Mavlon on 29/03/22.
//

import UIKit
import Alamofire
import SwiftyJSON

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
        
        self.sendImageAndGetFacesCount(img: imageView.image!) { count in
            
            self.resultStackView.isHidden = false
            self.resultLbl.text = "Detected \(count!) faces on photo"
            self.resultLbl.textColor = .black
            
            if count == "0" {
                self.resultLbl.text = "No face was detected on photo"
                self.resultLbl.textColor = .red
            }
            
        }
        
    }
    
    @IBAction func choosePhotoBtnPressed(_ sender: Any) {
 
        //Getting Image From Gallery
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
    func sendImageAndGetFacesCount(img: UIImage, done: @escaping (String?) -> Void) {
        
        let username = "acc_7c313d0c50e0078"
        let password = "f8d426959d4f08f419e05f2e44cb9e59"
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        
        var request = URLRequest(url: URL(string: "https://api.imagga.com/v2/faces/detections")!)
        
        request.httpMethod = "POST"
        request.addValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        
        AF.upload(multipartFormData: { multipart in
            
            let imgData = img.pngData()!
            
            multipart.append(imgData, withName: "image", fileName: "img.png", mimeType: "image/png")
            
        }, with: request).response { response in
            if let data = response.data {
                
                print("Succesful Response")
                
                let jsonData = JSON(data)
                
                let count = "\(jsonData["result"]["faces"].arrayValue.count)"
                
                done(count)
                
            } else {
                done(nil)
                print(response.error.debugDescription)
            }
        }
        
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
