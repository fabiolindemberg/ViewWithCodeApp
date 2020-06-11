//
//  CharacterCellCell.swift
//  StudyViewWithCode
//
//  Created by Fabio Lindemberg on 11/06/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

import UIKit
import SDWebImage

class CharacterCell: UITableViewCell {
    
    var lblName: UILabel!
    var lblTitle: UILabel!
    var lblHouse: UILabel!
    var imgCharacter: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        congigUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func congigUI() {
        
        let vwContent = UIView()
        
        self.contentView.addSubview(vwContent)
        
        vwContent.translatesAutoresizingMaskIntoConstraints = false
        vwContent.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        vwContent.setShadow(cornerRadius: 10)
        NSLayoutConstraint.activate([
            vwContent.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            vwContent.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            vwContent.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.95),
            vwContent.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.9)
        ])
        
        let svContent = UIStackView()
        svContent.distribution = .fillProportionally
        
        vwContent.addSubview(svContent)
        
        svContent.translatesAutoresizingMaskIntoConstraints = false
        svContent.axis = .horizontal
        svContent.spacing = 12
        svContent.distribution = .fill
        
        NSLayoutConstraint.activate([
            svContent.centerYAnchor.constraint(equalTo: vwContent.centerYAnchor),
            svContent.centerXAnchor.constraint(equalTo: vwContent.centerXAnchor),
            svContent.widthAnchor.constraint(equalTo: vwContent.widthAnchor, multiplier: 0.95),
            svContent.heightAnchor.constraint(equalTo: vwContent.heightAnchor, multiplier: 0.9)
        ])
        
        imgCharacter = UIImageView()
        let aspectRatioConstraint = NSLayoutConstraint(item: imgCharacter!,attribute: .height,relatedBy: .equal,toItem: imgCharacter,attribute: .width,multiplier: (1.0 / 0.7),constant: 0)
        
        imgCharacter.addConstraint(aspectRatioConstraint)
        imgCharacter.layer.cornerRadius = 6
        imgCharacter.clipsToBounds = true
        imgCharacter.frame = CGRect(x: 0, y: 0, width: 80, height: 100)
        
        let svTexts = UIStackView()
        svTexts.alignment = .top
        
        lblName = UILabel()
        lblName.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        
        lblHouse = UILabel()
        lblHouse.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        lblHouse.font = lblHouse.font.withSize(15)

        lblTitle = UILabel()
        lblTitle.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        lblTitle.font = lblTitle.font.withSize(13)
        lblTitle.numberOfLines = 3
        svContent.addArrangedSubview(imgCharacter)
        svTexts.addArrangedSubview(lblName)
        svTexts.addArrangedSubview(lblHouse)
        svTexts.addArrangedSubview(lblTitle)
        svContent.addArrangedSubview(svTexts)
        
        svTexts.translatesAutoresizingMaskIntoConstraints = false
        svTexts.axis = .vertical
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func load(character: Character) {
        //congigUI()
        
        if let url = character.imageLink {
            imgCharacter.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "userPlaceholder"))
        }
        lblHouse.text = character.house
        lblName.text = character.name
        lblTitle.text = character.titles.first ?? ""
    }
}
