//
//  MemberTableViewController.swift
//  UIKitDemoApp
//
//  Created by 최준현 on 11/23/23.
//

import UIKit
import CoreData

class MemberTableViewController: UITableViewController {
    
    let persistenceController = PersistenceController.shared
    var manageObjectContext: NSManagedObjectContext?
    var list = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manageObjectContext = persistenceController.container.viewContext
        list = read()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
                 self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberTableCell", for: indexPath) as! MemberTableViewCell
        
        // Configure the cell...
        cell.nameLabel?.text = list[indexPath.row]
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            deleteData(name: list[indexPath.row])
            list.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "MemberDetail"{
            let detailView = segue.destination as! DetailViewController
            let row = self.tableView.indexPathForSelectedRow!.row
            detailView.member = list[row]
            
        }
    }
    
    
    func read() -> [String] {
        
        guard let context = self.manageObjectContext else{
            return [String]()
        }
        
        
        let request: NSFetchRequest<Member> = Member.fetchRequest()
        
        
        var list = [String]()
        
        do{
            let results = try context.fetch(request as! NSFetchRequest<NSFetchRequestResult>)
            
            for data in results{
                let match = data as! NSManagedObject
                
                let name = match.value(forKey: "name") as! String
                
                
                list.append(name)
            }
            
            
        }catch{
            fatalError("DataNot Found ")
        }
        return list
    }
    
    func deleteData(name: String){
        if let context = manageObjectContext, let entity = NSEntityDescription.entity(forEntityName: "Member", in: context){
            
            
            let request: NSFetchRequest<Member> = Member.fetchRequest()
            request.entity = entity
            
            let pred = NSPredicate(format: "(name = %@)", name)
            request.predicate = pred
            
            
            do{
                let results = try context.fetch(request as! NSFetchRequest<NSFetchRequestResult>)
                
                if results.count > 0{
                    let match = results[0] as! NSManagedObject
                    context.delete(match)
                   try  context.save()
                    
                }else{
                    
                }
            }catch let error{
                fatalError(error.localizedDescription)
            }
        }
        
    }
}
