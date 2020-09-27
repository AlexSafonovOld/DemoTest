//
//  GitDataModel.swift
//  GitRepository
//
//  Created by Алексей Сафонов on 24.09.2020.
//

import Foundation


 typealias gitData = [RepoUsers]



struct RepoUsers: Decodable {
    let  name: String
    let fullName: String
    let owner: Owner
    enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
        case owner
    }
}


struct Owner: Decodable {
    let avatarURL: String
   
    
    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
       
    }
}
