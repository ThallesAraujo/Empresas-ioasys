//
//  EnterpriseCell.swift
//  empresas-ioasys
//
//  Created by Thalles Araújo on 16/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import UIKit
import Kingfisher

class EnterpriseCell: UITableViewCell {
    
    @IBOutlet weak var enterpriseImage: UIImageView!
    @IBOutlet weak var lblEnterpriseName: UILabel!
    @IBOutlet weak var lblEnterpriseType: UILabel!
    @IBOutlet weak var lblEnterpriseLocation: UILabel!
    
    private var enterprise: Enterprise?
    
    private var coordinator: Coordinator?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(enterprise: Enterprise?, coordinator: Coordinator?){
        
        if let enterprise = enterprise{
            self.coordinator = coordinator
            self.enterprise = enterprise
    
            self.enterpriseImage.kf.setImage(with: URL.init(string: ImageHelper.getImage((enterprise.photo)) ), placeholder: UIImage.init(named: "enterprise_placeholder"), options: [.forceRefresh], progressBlock: nil, completionHandler: nil)
            self.enterpriseImage.roundCorners()
            self.lblEnterpriseName.text = enterprise.enterprise_name
            
            self.lblEnterpriseType.text = enterprise.enterprise_type?.enterprise_name_type
            self.lblEnterpriseLocation.text = "\(enterprise.city), \(enterprise.country)"
        }
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected{
            if let coordinator = self.coordinator as? EnterprisesCoordinator{
                coordinator.enterprise = self.enterprise
                coordinator.start()
            }
        }
    }

}
