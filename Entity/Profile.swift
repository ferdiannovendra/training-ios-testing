//
//  Profile.swift
//  testing
//
//  Created by P090MMCTSE014 on 18/10/23.
//

import Foundation

struct Profile {
    let name: String
    let job: String
    let age: Int
    let bio: String
}


enum ProfileType: String {
    case name = "Nama"
    case job = "Pekerjaan"
    case age = "Umur"
    case bio = "Deskripsi"
}
