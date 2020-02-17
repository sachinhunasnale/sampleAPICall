//
//  ViewController.swift
//  sampleAPICall
//
//  Created by Sachin Baburao on 04/02/20.
//  Copyright © 2020 3i Infotech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var employeeViewModel = [EmpViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        
        fetchData()
    }
    
    fileprivate func fetchData() {
    
        APIService.SharedAPIService.fetchEmployeeDetail() {  result in
            
            switch result {
                case .success(let employeeDetail):
                           self.employeeViewModel = employeeDetail.data.map({return EmpViewModel(employee: $0)})
                           print("\(self.employeeViewModel)")
                           DispatchQueue.main.async {
                             self.tableView.reloadData()
                          }
                
                case .failure:
                      print("failed")
            }
           
      }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeViewModel.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EmployeeTableViewCell
        cell.empViewModel = employeeViewModel[indexPath.row]
        return cell;
    }
}

