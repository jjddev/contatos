//
//  FotosCollectionViewController.swift
//  contatos
//
//  Created by PUCPR on 27/03/19.
//  Copyright © 2019 PUCPR. All rights reserved.
//

import UIKit
import Photos
import UserNotifications



private let reuseIdentifier = "foto"

class FotosCollectionViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var contatoViewModel : ContatoViewModel?
    var contato: Contato?
    var fotos = [UIImage]()
    var picker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()

        picker.delegate = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return fotos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FotoUICollectionViewCell
        //cell.vTexto.text = nomes[indexPath.row]
        // Configure the cell
        checkPermission()
        if fotos.count > 0 {
            
            //cell.vFoto = UIImageView(image: fotos[indexPath.row])
            cell.vFoto.image = fotos[indexPath.row]
            
           // self.collectionView.insertItems(at: [IndexPath(item: fotos.count, section: 0)])
        }
        
        
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

    @IBAction func salvarFoto(_ sender: Any) {

        
        checkPermission()
        
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        checkPermission()
        
        print(fotos.count)
        
        let i = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
         //UIImageWriteToSavedPhotosAlbum(i, nil, nil, nil)
    
        fotos.append(i)

        collectionView.reloadData()
        
        picker.dismiss(animated: false, completion: nil)
        
        
    }
    
    func checkPermission() {
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus(); switch photoAuthorizationStatus {
        case .authorized: print("Access is granted by user")
        case .notDetermined: PHPhotoLibrary.requestAuthorization({
            (newStatus) in print("status is \(newStatus)"); if newStatus == PHAuthorizationStatus.authorized {  print("success") }
            })
            case .restricted:  print("User do not have access to photo album.")
            case .denied:  print("User has denied the permission.")
            }
        }
}
