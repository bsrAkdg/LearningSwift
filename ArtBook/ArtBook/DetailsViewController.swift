//
//  DetailsViewController.swift
//  ArtBook
//
//  Created by Büşra Serdaroğlu on 17.04.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldArtist: UITextField!
    @IBOutlet weak var textFieldYear: UITextField!
    @IBOutlet weak var buttonSave: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addKeyboardRecognizer()

        addUploadAction()
    }
    
    func addKeyboardRecognizer() {
        // close keyboard when clicked anywhere
        let closeKeyboardRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(closeKeyboardRecognizer)
    }
    
    func addUploadAction() {
        imageView.isUserInteractionEnabled = true
        let uploadImageRecognizer = UITapGestureRecognizer(target: self, action: #selector(openGallery))
        imageView.addGestureRecognizer(uploadImageRecognizer)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc func openGallery() {
        // Needed UIImagePickerControllerDelegate and UINavigationControllerDelegate implementation
        // didFinishPickingMediaWithInfo provides acces that received gallery data
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary // or camera, savedPhotosAlbum
        picker.allowsEditing = true // editable
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView.image = info[.editedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savePainting(_ sender: Any) {
        // get AppDelegate instance for access save and
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        // add import CoreData for NSEntityDescription
        let newPainting = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        // Attributes : forKeys must be the same Paintings fields name on ArtBook.xcdatamodeld
        
        newPainting.setValue(textFieldName.text, forKey: "name")
        newPainting.setValue(textFieldArtist.text, forKey: "artist")

        if let year = Int(textFieldYear.text!) {
            newPainting.setValue(year, forKey: "year")
        }
        
        newPainting.setValue(UUID(), forKey: "id")

        let data = imageView.image?.jpegData(compressionQuality: 0.5)
        newPainting.setValue(data, forKey: "image")
        
        do {
            try context.save()
            print("Success")
        } catch {
            print("Error")
        }
    }
}
