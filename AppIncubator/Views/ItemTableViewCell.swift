//
//  ItemTableViewCell.swift
//  AppIncubator
//
//  Created by apple on 14/09/22.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var titleLabel: UILabel!
    
    var addButtonAction: (() -> ())?
    var stepperValueChanged: (() -> ())?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configure()
    }
    
    private func configure() {
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 20
        containerView.layer.borderColor = #colorLiteral(red: 0.953397572, green: 0.5983874798, blue: 0.2561153471, alpha: 1)
        addButton.setTitleColor(#colorLiteral(red: 0.953397572, green: 0.5983874798, blue: 0.2561153471, alpha: 1), for: .normal)
        stepper.isHidden = true
        quantityLabel.isHidden = true
        addButton.isHidden = false
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        stepperValueChanged?()

    }
    @IBAction func addButtonClicked(_ sender: Any) {
        addButtonAction?()

    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
