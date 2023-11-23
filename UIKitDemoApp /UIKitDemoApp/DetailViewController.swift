//
//  DetailViewController.swift
//  UIKitDemoApp
//
//  Created by 최준현 on 11/23/23.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {

    @IBOutlet var detailInfo: UITextView!
    @IBOutlet var detailAge: UILabel!
    @IBOutlet var detailName: UILabel!
    
    let persistenceController = PersistenceController.shared
    var manageObjectContext: NSManagedObjectContext?
    
    var member: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        manageObjectContext = persistenceController.container.viewContext
        // Do any additional setup after loading the view.
        if let data = member, let context = manageObjectContext, let entity = NSEntityDescription.entity(forEntityName: "Member", in: context){
            detailName.text = data
            
            let request: NSFetchRequest<Member> = Member.fetchRequest()
            request.entity = entity
            
            let pred = NSPredicate(format: "(name = %@)", data)
            request.predicate = pred
            
            
            do{
                let results = try context.fetch(request as! NSFetchRequest<NSFetchRequestResult>)
                
                if results.count > 0{
                    let match = results[0] as! NSManagedObject
                    
                    detailInfo.text = match.value(forKey: "info") as? String
                    detailAge.text = match.value(forKey: "age") as? String
                    
                }else{
                    
                }
            }catch let error{
                fatalError("Not Found ")
            }
            
//            detailAge.text = data.age
//            detailInfo.text = data.info
        }
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
