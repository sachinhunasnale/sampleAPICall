//
//  UserModel.swift
//  sampleAPICall
//
//  Created by Sachin Baburao on 04/02/20.
//  Copyright © 2020 3i Infotech. All rights reserved.
//

import Foundation

struct Details:Decodable {
    let id: String
    let employee_name: String
    let employee_salary: String
    let employee_age: String
    let profile_image: String
}

struct Employee:Decodable {
    let status:String
    let data:[Details]
}
