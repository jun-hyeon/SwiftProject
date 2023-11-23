//
//  AddViewController.swift
//  UIKitDemoApp
//
//  Created by 최준현 on 11/23/23.
//

import UIKit
import CoreData

class AddViewController: UIViewController {

    @IBOutlet var addInfoText: UITextField!
    @IBOutlet var addNameText: UITextField!
    @IBOutlet var addAgeText: UITextField!
    
    let persistenceController = PersistenceController.shared
    var manageObjectContext: NSManagedObjectContext?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        manageObjectContext = persistenceController.container.viewContext
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func saveMember(_ sender: UIButton) {
        if let context = self.manageObjectContext, let entity = NSEntityDescription.entity(forEntityName: "Member", in: context){
            let member = Member(entity: entity, insertInto: context)
            member.name = addNameText.text
            member.age = addAgeText.text
            member.info = addInfoText.text
            
            do{
                try context.save()
                print(member)
                self.dismiss(animated: true)
            }catch{
                let error = error as NSError
                fatalError("An error occurred: \(error)")
            }
        }
    }
}
