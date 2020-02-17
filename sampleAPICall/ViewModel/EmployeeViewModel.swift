//
//  EmployeeViewModel.swift
//  sampleAPICall
//
//  Created by Sachin Baburao on 17/02/20.
//  Copyright © 2020 3i Infotech. All rights reserved.
//

import Foundation

struct EmpViewModel {
    let name: String
    let salary:String
    
    init(employee:Details){
        self.name = employee.employee_name
        self.salary = employee.employee_salary
    }
}
