//
//  ViewController.swift
//  AppIncubator
//
//  Created by apple on 14/09/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var placeOrderButton: UIButton!
    @IBOutlet weak var menuTableView: UITableView!

    var dataArray: MenuDataModel?
    var fullPrice = 0
    var priceAtCatOne = 0
    var priceAtCatTwo = 0
    var priceAtCatThree = 0
    var priceAtCatFour = 0
    var priceAtCatFive = 0
    var priceAtCatSix = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configure()
        getMenuItems()

    }
    private func configure() {
        self.title = "Menu"
    }
    
    private func findFullPrice() {
        fullPrice = priceAtCatOne + priceAtCatTwo + priceAtCatThree + priceAtCatFour + priceAtCatFive + priceAtCatSix
        if fullPrice != 0 {
            placeOrderButton.setTitle("Place Order \u{20B9}\(fullPrice)", for: .normal)
        } else {
            placeOrderButton.setTitle("Place Order", for: .normal)
        }
    }
    
    private func getMenuItems() {
        
        // Simulating an API call where we get a 'Data' type object, here we have menuObj which is in 'Data' type
        
        guard let menuObj = readJSONFromFile(fileName: "MenuJson") else {return}
        
        let decoder = JSONDecoder()
        do {
            // As we are simulating API call, these below steps are to bind the API response (menuObj in our case) to the data model
            let response = try decoder.decode(MenuDataModel.self, from: menuObj)
            self.dataArray = response
            for i in 0..<self.dataArray!.cat1!.count {
                self.dataArray?.cat1?[i].stepperHidden = true
                self.dataArray?.cat1?[i].quantity = 1
            }
            for i in 0..<self.dataArray!.cat2!.count {
                self.dataArray?.cat2?[i].stepperHidden = true
                self.dataArray?.cat2?[i].quantity = 1
            }
            for i in 0..<self.dataArray!.cat3!.count {
                self.dataArray?.cat3?[i].stepperHidden = true
                self.dataArray?.cat3?[i].quantity = 1
            }
            for i in 0..<self.dataArray!.cat4!.count {
                self.dataArray?.cat4?[i].stepperHidden = true
                self.dataArray?.cat4?[i].quantity = 1
            }
            for i in 0..<self.dataArray!.cat5!.count {
                self.dataArray?.cat5?[i].stepperHidden = true
                self.dataArray?.cat5?[i].quantity = 1
            }
            for i in 0..<self.dataArray!.cat6!.count {
                self.dataArray?.cat6?[i].stepperHidden = true
                self.dataArray?.cat6?[i].quantity = 1
            }
            DispatchQueue.main.async {
                self.menuTableView.reloadData()
            }
        } catch {
            print("Error at Decoding \(error.localizedDescription)")
        }
    }
    
    private func readJSONFromFile(fileName: String) -> Data? {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                let responseData = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                return responseData
            } catch {
                print("Error at JSONSerialization \(error.localizedDescription)")
            }
        }
        return nil
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 91
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return dataArray?.cat1?.count ?? 0
        }
        else if section == 1 {
            return dataArray?.cat2?.count ?? 0
        }
        else if section == 2 {
            return dataArray?.cat3?.count ?? 0
        }
        else if section == 3 {
            return dataArray?.cat4?.count ?? 0
        }
        else if section == 4 {
            return dataArray?.cat5?.count ?? 0
        }
        else if section == 5 {
            return dataArray?.cat6?.count ?? 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemsCell", for: indexPath) as! ItemTableViewCell
        
        // MARK: - Data Population
        
        if indexPath.section == 0 {
            if let categoryOne = dataArray?.cat1 {
                if categoryOne[indexPath.row].instock == false {
                    cell.addButton.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
                    cell.containerView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                    cell.addButton.isUserInteractionEnabled = false
                } else {
                    cell.addButton.isUserInteractionEnabled = true
                    cell.containerView.layer.borderColor = #colorLiteral(red: 0.953397572, green: 0.5983874798, blue: 0.2561153471, alpha: 1)
                    cell.addButton.setTitleColor(#colorLiteral(red: 0.953397572, green: 0.5983874798, blue: 0.2561153471, alpha: 1), for: .normal)
                }
                if categoryOne[indexPath.row].stepperHidden == true {
                    cell.addButton.isHidden = false
                    cell.stepper.isHidden = true
                    cell.quantityLabel.isHidden = true
                } else {
                    cell.addButton.isHidden = true
                    cell.stepper.isHidden = false
                    cell.quantityLabel.isHidden = false
                }
                cell.titleLabel.text = categoryOne[indexPath.row].name
                cell.subtitleLabel.text = "\(categoryOne[indexPath.row].price ?? 0)"
                cell.quantityLabel.text = "\(categoryOne[indexPath.row].quantity ?? 1)"
            }
        }
        if indexPath.section == 1 {
            if let categoryTwo = dataArray?.cat2 {
                if categoryTwo[indexPath.row].instock == false {
                    cell.addButton.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
                    cell.containerView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                    cell.addButton.isUserInteractionEnabled = false
                } else {
                    cell.addButton.isUserInteractionEnabled = true
                    cell.containerView.layer.borderColor = #colorLiteral(red: 0.953397572, green: 0.5983874798, blue: 0.2561153471, alpha: 1)
                    cell.addButton.setTitleColor(#colorLiteral(red: 0.953397572, green: 0.5983874798, blue: 0.2561153471, alpha: 1), for: .normal)
                }
                if categoryTwo[indexPath.row].stepperHidden == true {
                    cell.addButton.isHidden = false
                    cell.stepper.isHidden = true
                    cell.quantityLabel.isHidden = true
                } else {
                    cell.addButton.isHidden = true
                    cell.stepper.isHidden = false
                    cell.quantityLabel.isHidden = false
                }
                cell.titleLabel.text = categoryTwo[indexPath.row].name
                cell.subtitleLabel.text = "\(categoryTwo[indexPath.row].price ?? 0)"
                cell.quantityLabel.text = "\(categoryTwo[indexPath.row].quantity ?? 1)"
            }
        }
        if indexPath.section == 2 {
            if let categoryThree = dataArray?.cat3 {
                if categoryThree[indexPath.row].instock == false {
                    cell.addButton.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
                    cell.containerView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                    cell.addButton.isUserInteractionEnabled = false
                } else {
                    cell.addButton.isUserInteractionEnabled = true
                    cell.containerView.layer.borderColor = #colorLiteral(red: 0.953397572, green: 0.5983874798, blue: 0.2561153471, alpha: 1)
                    cell.addButton.setTitleColor(#colorLiteral(red: 0.953397572, green: 0.5983874798, blue: 0.2561153471, alpha: 1), for: .normal)
                }
                if categoryThree[indexPath.row].stepperHidden == true {
                    cell.addButton.isHidden = false
                    cell.stepper.isHidden = true
                    cell.quantityLabel.isHidden = true
                } else {
                    cell.addButton.isHidden = true
                    cell.stepper.isHidden = false
                    cell.quantityLabel.isHidden = false
                }
                cell.titleLabel.text = categoryThree[indexPath.row].name
                cell.subtitleLabel.text = "\(categoryThree[indexPath.row].price ?? 0)"
                cell.quantityLabel.text = "\(categoryThree[indexPath.row].quantity ?? 1)"
            }
        }
        if indexPath.section == 3 {
            if let categoryFour = dataArray?.cat4 {
                if categoryFour[indexPath.row].instock == false {
                    cell.addButton.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
                    cell.containerView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                    cell.addButton.isUserInteractionEnabled = false
                } else {
                    cell.addButton.isUserInteractionEnabled = true
                    cell.containerView.layer.borderColor = #colorLiteral(red: 0.953397572, green: 0.5983874798, blue: 0.2561153471, alpha: 1)
                    cell.addButton.setTitleColor(#colorLiteral(red: 0.953397572, green: 0.5983874798, blue: 0.2561153471, alpha: 1), for: .normal)
                }
                if categoryFour[indexPath.row].stepperHidden == true {
                    cell.addButton.isHidden = false
                    cell.stepper.isHidden = true
                    cell.quantityLabel.isHidden = true
                } else {
                    cell.addButton.isHidden = true
                    cell.stepper.isHidden = false
                    cell.quantityLabel.isHidden = false
                }
                cell.titleLabel.text = categoryFour[indexPath.row].name
                cell.subtitleLabel.text = "\(categoryFour[indexPath.row].price ?? 0)"
                cell.quantityLabel.text = "\(categoryFour[indexPath.row].quantity ?? 1)"
            }
        }
        if indexPath.section == 4 {
            if let categoryFive = dataArray?.cat5 {
                if categoryFive[indexPath.row].instock == false {
                    cell.addButton.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
                    cell.containerView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                    cell.addButton.isUserInteractionEnabled = false
                } else {
                    cell.addButton.isUserInteractionEnabled = true
                    cell.containerView.layer.borderColor = #colorLiteral(red: 0.953397572, green: 0.5983874798, blue: 0.2561153471, alpha: 1)
                    cell.addButton.setTitleColor(#colorLiteral(red: 0.953397572, green: 0.5983874798, blue: 0.2561153471, alpha: 1), for: .normal)
                }
                if categoryFive[indexPath.row].stepperHidden == true {
                    cell.addButton.isHidden = false
                    cell.stepper.isHidden = true
                    cell.quantityLabel.isHidden = true
                } else {
                    cell.addButton.isHidden = true
                    cell.stepper.isHidden = false
                    cell.quantityLabel.isHidden = false
                }
                cell.titleLabel.text = categoryFive[indexPath.row].name
                cell.subtitleLabel.text = "\(categoryFive[indexPath.row].price ?? 0)"
                cell.quantityLabel.text = "\(categoryFive[indexPath.row].quantity ?? 1)"
            }
        }
        if indexPath.section == 5 {
            if let categorySix = dataArray?.cat6 {
                if categorySix[indexPath.row].instock == false {
                    cell.addButton.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
                    cell.containerView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                    cell.addButton.isUserInteractionEnabled = false
                } else {
                    cell.addButton.isUserInteractionEnabled = true
                    cell.containerView.layer.borderColor = #colorLiteral(red: 0.953397572, green: 0.5983874798, blue: 0.2561153471, alpha: 1)
                    cell.addButton.setTitleColor(#colorLiteral(red: 0.953397572, green: 0.5983874798, blue: 0.2561153471, alpha: 1), for: .normal)
                }
                if categorySix[indexPath.row].stepperHidden == true {
                    cell.addButton.isHidden = false
                    cell.stepper.isHidden = true
                    cell.quantityLabel.isHidden = true
                } else {
                    cell.addButton.isHidden = true
                    cell.stepper.isHidden = false
                    cell.quantityLabel.isHidden = false
                }
                cell.titleLabel.text = categorySix[indexPath.row].name
                cell.subtitleLabel.text = "\(categorySix[indexPath.row].price ?? 0)"
            }
        }
        
        // MARK: - Add Button Action
        
        cell.addButtonAction = { [self] in
            print("clicked addButton on \(indexPath.section) \(indexPath.row)")
            if indexPath.section == 0 {
                if self.dataArray?.cat1?[indexPath.row].stepperHidden == true {
                    self.dataArray?.cat1?[indexPath.row].stepperHidden = false
                }
                cell.stepper.value = 1
                dataArray?.cat1?[indexPath.row].quantity = 1
                priceAtCatOne = dataArray?.cat1?[indexPath.row].price ?? 0
                self.menuTableView.reloadData()
            }
            if indexPath.section == 1 {
                if self.dataArray?.cat2?[indexPath.row].stepperHidden == true {
                    self.dataArray?.cat2?[indexPath.row].stepperHidden = false
                }
                cell.stepper.value = 1
                dataArray?.cat2?[indexPath.row].quantity = 1
                priceAtCatTwo = dataArray?.cat2?[indexPath.row].price ?? 0
                self.menuTableView.reloadData()
            }
            if indexPath.section == 2 {
                if self.dataArray?.cat3?[indexPath.row].stepperHidden == true {
                    self.dataArray?.cat3?[indexPath.row].stepperHidden = false
                }
                cell.stepper.value = 1
                dataArray?.cat3?[indexPath.row].quantity = 1
                priceAtCatThree = dataArray?.cat3?[indexPath.row].price ?? 0
                self.menuTableView.reloadData()
            }
            if indexPath.section == 3 {
                if self.dataArray?.cat4?[indexPath.row].stepperHidden == true {
                    self.dataArray?.cat4?[indexPath.row].stepperHidden = false
                }
                cell.stepper.value = 1
                dataArray?.cat3?[indexPath.row].quantity = 1
                priceAtCatFour = dataArray?.cat4?[indexPath.row].price ?? 0
                self.menuTableView.reloadData()
            }
            if indexPath.section == 4 {
                if self.dataArray?.cat5?[indexPath.row].stepperHidden == true {
                    self.dataArray?.cat5?[indexPath.row].stepperHidden = false
                }
                cell.stepper.value = 1
                dataArray?.cat4?[indexPath.row].quantity = 1
                priceAtCatFive = dataArray?.cat5?[indexPath.row].price ?? 0
                self.menuTableView.reloadData()
            }
            if indexPath.section == 5 {
                if self.dataArray?.cat6?[indexPath.row].stepperHidden == true {
                    self.dataArray?.cat6?[indexPath.row].stepperHidden = false
                }
                cell.stepper.value = 1
                dataArray?.cat5?[indexPath.row].quantity = 1
                priceAtCatSix = dataArray?.cat6?[indexPath.row].price ?? 0
                self.menuTableView.reloadData()
            }
            findFullPrice()
        }
        
        // MARK: - Stepper Action
        
        cell.stepperValueChanged = { [self] in
            print("clicked stepper on \(indexPath.section) \(indexPath.row)")
            if indexPath.section == 0 {
                let quantity = Int(cell.stepper.value)
                dataArray?.cat1?[indexPath.row].quantity = quantity
                if quantity == 0 {
                    dataArray?.cat1?[indexPath.row].stepperHidden = true
                } else {
                    dataArray?.cat1?[indexPath.row].stepperHidden = false
                }
                priceAtCatOne = (quantity * (dataArray?.cat1?[indexPath.row].price ?? 0))
                menuTableView.reloadData()
            }
            if indexPath.section == 1 {
                let quantity = Int(cell.stepper.value)
                dataArray?.cat2?[indexPath.row].quantity = quantity
                if quantity == 0 {
                    dataArray?.cat2?[indexPath.row].stepperHidden = true
                } else {
                    dataArray?.cat2?[indexPath.row].stepperHidden = false
                }
                priceAtCatTwo = (quantity * (dataArray?.cat2?[indexPath.row].price ?? 0))
                menuTableView.reloadData()
            }
            if indexPath.section == 2 {
                let quantity = Int(cell.stepper.value)
                dataArray?.cat3?[indexPath.row].quantity = quantity
                if quantity == 0 {
                    dataArray?.cat3?[indexPath.row].stepperHidden = true
                } else {
                    dataArray?.cat3?[indexPath.row].stepperHidden = false
                }
                priceAtCatThree = (quantity * (dataArray?.cat3?[indexPath.row].price ?? 0))
                menuTableView.reloadData()
            }
            if indexPath.section == 3 {
                let quantity = Int(cell.stepper.value)
                dataArray?.cat4?[indexPath.row].quantity = quantity
                if quantity == 0 {
                    dataArray?.cat4?[indexPath.row].stepperHidden = true
                } else {
                    dataArray?.cat4?[indexPath.row].stepperHidden = false
                }
                priceAtCatFour = (quantity * (dataArray?.cat4?[indexPath.row].price ?? 0))
                menuTableView.reloadData()
            }
            if indexPath.section == 4 {
                let quantity = Int(cell.stepper.value)
                dataArray?.cat5?[indexPath.row].quantity = quantity
                if quantity == 0 {
                    dataArray?.cat5?[indexPath.row].stepperHidden = true
                } else {
                    dataArray?.cat5?[indexPath.row].stepperHidden = false
                }
                priceAtCatFive = (quantity * (dataArray?.cat5?[indexPath.row].price ?? 0))
                menuTableView.reloadData()
            }
            if indexPath.section == 5 {
                let quantity = Int(cell.stepper.value)
                dataArray?.cat6?[indexPath.row].quantity = quantity
                if quantity == 0 {
                    dataArray?.cat6?[indexPath.row].stepperHidden = true
                } else {
                    dataArray?.cat6?[indexPath.row].stepperHidden = false
                }
                priceAtCatSix = (quantity * (dataArray?.cat6?[indexPath.row].price ?? 0))
                menuTableView.reloadData()
            }
            findFullPrice()
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        headerView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        let label = UILabel(frame: CGRect(x: 10,
                                          y: 5,
                                          width: 100,
                                          height: 30))
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .red
        label.numberOfLines = 0
        label.text = "Cat \(section + 1)"
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


