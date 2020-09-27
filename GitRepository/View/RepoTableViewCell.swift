//
//  RepoTableViewCell.swift
//  GitRepository
//
//  Created by Алексей Сафонов on 26.09.2020.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var nameRepository: UILabel!
    @IBOutlet weak var fullnameWithLogin: UILabel!
    
    
    
    func setCellInfo(_ repo: RepoUsers) {
               self.updateUI(name: repo.name , fullname: repo.fullName, image: repo.owner.avatarURL)
      
      
        
    }
    
    
    private func updateUI(name : String?, fullname: String?, image: String?){
      
        self.nameRepository.text = name
        self.fullnameWithLogin.text = fullname
      
        guard  let urlImage = URL(string: image!) else {
            self.imageUser.image = UIImage(systemName: "folder")
            return
        }
        guard let data = try? Data(contentsOf: urlImage) else {
            self.imageUser.image = UIImage(systemName: "folder")
            return }
        DispatchQueue.main.async {
            self.imageUser.layer.cornerRadius = self.imageUser.frame.size.height / 2
            self.imageUser.clipsToBounds = true
            self.imageUser?.image = UIImage(data: data)
        }
       
        
            }
}
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }


