//
//  GitDataViewModel.swift
//  GitRepository
//
//  Created by Алексей Сафонов on 24.09.2020.
//

import Foundation
class GitDataViewModel {

    var repoInfo = [RepoUsers]()

    func numberOFRowsInSection(section: Int) -> Int {
        if repoInfo.count != 0 {
            return repoInfo.count
        }
        return 0
    }
    func cellForRowAt(indexPath: IndexPath) -> RepoUsers {
        return repoInfo[indexPath.row]
    }
    
}
