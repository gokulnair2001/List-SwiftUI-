//
//  ViewController.swift
//  Dock
//
//  Created by Gokul Nair on 30/04/21.
//

import UIKit
import CloudKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let dataBase = CKContainer(identifier: "iCloud.dock").publicCloudDatabase
    
    var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        fetchItems()
    }
    
    @IBAction func addButton(_ sender: Any) {
        alertDataBox()
    }
    
    func alertDataBox() {
        let alert = UIAlertController(title: "Add Item", message: nil, preferredStyle: .alert)
        
        alert.addTextField { field in
            field.placeholder = "Add Item"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: {[weak self] _ in
            if let fields = alert.textFields?.first, let text = fields.text, !text.isEmpty {
                self?.saveData(name: text)
            }
        }))
        present(alert, animated: true)
    }
    func saveData(name: String) {
        let record = CKRecord(recordType: "TodoItem")
        record.setValue(name, forKey: "name")
        dataBase.save(record) { record, error in
            if record != nil, error == nil {
                // Due to the laginess of iCloud this wont work as expected
                self.fetchItems()
            }
        }
    }
    
    func fetchItems() {
        let query = CKQuery(recordType: "TodoItem", predicate: NSPredicate(value: true))
        dataBase.perform(query, inZoneWith: nil) { [weak self] records, error in
            guard let records = records, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.items = records.compactMap({$0.value(forKey: "name") as? String})
                self?.tableView.reloadData()
            }
        }
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    
}

