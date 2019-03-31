//
//  t.swift
//  contatos
//
//  Created by juliano on 31/03/19.
//  Copyright © 2019 PUCPR. All rights reserved.
//

import UIKit

class t: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var picker = UIImagePickerController()
    
    
    @IBAction func salvar(_ sender: Any) {
        
    }
    
    @IBOutlet weak var foto: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.delegate = self  
        
        dismiss(animated: false, completion: nil)
        
        let i = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        foto.image = i
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
