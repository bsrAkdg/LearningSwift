//
//  ViewController.swift
//  ArtBook
//
//  Created by Büşra Serdaroğlu on 17.04.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

// for insert core data you must use NSEntityDescription
// for get, delete core data you must use NSFetchRequest

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var paintingNames = [String]()
    var paintingIds = [UUID]()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setNavigationDetails()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getPaintingsData()
        
        navigationItem.title = "Art Book"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // subsucribe "New Data"
        NotificationCenter.default.addObserver(self, selector: #selector(getPaintingsData), name: NSNotification.Name("NewPainting"), object: nil)
    }
    
    @objc func getPaintingsData() {
        
        paintingNames.removeAll(keepingCapacity: false)
        paintingIds.removeAll(keepingCapacity: false)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        // Needed import CoreData
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
        fetchRequest.returnsObjectsAsFaults = false // dont use cache small entities
        
        do {
            let results = try context.fetch(fetchRequest)
            
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                   // [NSManagedObject] provides handle as a Core Data
                   if let name = result.value(forKey: "name") as? String {
                       paintingNames.append(name)
                       if let id = result.value(forKey: "id") as? UUID{
                           paintingIds.append(id)
                       }
                   }
                   self.tableView.reloadData()
                }
            }
           
        } catch {
            print("Error")
        }
    }
    
    func setNavigationDetails() {
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addNewPainting))
    }

    @objc func addNewPainting() {
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paintingNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = paintingNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" && sender != nil {
            let index = sender as! Int
            let detailVC = segue.destination as! DetailsViewController
            detailVC.chosenPainting = paintingNames[index]
            detailVC.chosenPaintingId = paintingIds[index]
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            
            let deletedId = paintingIds[indexPath.row].uuidString
            
            fetchRequest.predicate = NSPredicate(format: "id = %@", deletedId)
            
            fetchRequest.returnsObjectsAsFaults = false // dont use cache
            
            do {
                let results = try context.fetch(fetchRequest)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        if let id = result.value(forKey: "id") as? UUID {
                            if id.uuidString == deletedId {
                            
                                context.delete(result)
                                
                                paintingNames.remove(at: indexPath.row)
                                paintingIds.remove(at: indexPath.row)
                                self.tableView.reloadData()
                                
                                try context.save()
                                break
                            }
                        }
                    }
                }
            } catch {
                print("Error")
            }
            
        }
    }
}

