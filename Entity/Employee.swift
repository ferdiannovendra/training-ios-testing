//
//  Employee.swift
//  testing
//
//  Created by P090MMCTSE014 on 18/10/23.
//

import Foundation

struct Wrapper: Decodable {
    let data: [Employee]
}

struct Employee: Decodable {
    let nama: String
    let gaji: Int
    let umur: Int
    
    enum CodingKeys: String, CodingKey {
        case nama = "employee_name"
        case gaji = "employee_salary"
        case umur = "employee_age"
    }
}
