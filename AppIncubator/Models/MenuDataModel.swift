//
//  MenuDataModel.swift
//  AppIncubator
//
//  Created by apple on 14/09/22.
//

import Foundation
struct MenuDataModel : Codable {
    var cat1 : [Cat1]?
    var cat2 : [Cat2]?
    var cat3 : [Cat3]?
    var cat4 : [Cat4]?
    var cat5 : [Cat5]?
    var cat6 : [Cat6]?

    enum CodingKeys: String, CodingKey {

        case cat1 = "cat1"
        case cat2 = "cat2"
        case cat3 = "cat3"
        case cat4 = "cat4"
        case cat5 = "cat5"
        case cat6 = "cat6"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        cat1 = try values.decodeIfPresent([Cat1].self, forKey: .cat1)
        cat2 = try values.decodeIfPresent([Cat2].self, forKey: .cat2)
        cat3 = try values.decodeIfPresent([Cat3].self, forKey: .cat3)
        cat4 = try values.decodeIfPresent([Cat4].self, forKey: .cat4)
        cat5 = try values.decodeIfPresent([Cat5].self, forKey: .cat5)
        cat6 = try values.decodeIfPresent([Cat6].self, forKey: .cat6)
    }
}

struct Cat1 : Codable {
    let name : String?
    let price : Int?
    let instock : Bool?
    var quantity : Int?
    var stepperHidden : Bool?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case price = "price"
        case instock = "instock"
        case quantity = "quantity"
        case stepperHidden = "stepperHidden"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        instock = try values.decodeIfPresent(Bool.self, forKey: .instock)
        quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
        stepperHidden = try values.decodeIfPresent(Bool.self, forKey: .stepperHidden)
    }
}

struct Cat2 : Codable {
    let name : String?
    let price : Int?
    let instock : Bool?
    var quantity : Int?
    var stepperHidden : Bool?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case price = "price"
        case instock = "instock"
        case quantity = "quantity"
        case stepperHidden = "stepperHidden"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        instock = try values.decodeIfPresent(Bool.self, forKey: .instock)
        quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
        stepperHidden = try values.decodeIfPresent(Bool.self, forKey: .stepperHidden)
    }
}

struct Cat3 : Codable {
    let name : String?
    let price : Int?
    let instock : Bool?
    var quantity : Int?
    var stepperHidden : Bool?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case price = "price"
        case instock = "instock"
        case quantity = "quantity"
        case stepperHidden = "stepperHidden"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        instock = try values.decodeIfPresent(Bool.self, forKey: .instock)
        quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
        stepperHidden = try values.decodeIfPresent(Bool.self, forKey: .stepperHidden)
    }
}

struct Cat4 : Codable {
    let name : String?
    let price : Int?
    let instock : Bool?
    var quantity : Int?
    var stepperHidden : Bool?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case price = "price"
        case instock = "instock"
        case quantity = "quantity"
        case stepperHidden = "stepperHidden"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        instock = try values.decodeIfPresent(Bool.self, forKey: .instock)
        quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
        stepperHidden = try values.decodeIfPresent(Bool.self, forKey: .stepperHidden)
    }
}

struct Cat5 : Codable {
    let name : String?
    let price : Int?
    let instock : Bool?
    var quantity : Int?
    var stepperHidden : Bool?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case price = "price"
        case instock = "instock"
        case quantity = "quantity"
        case stepperHidden = "stepperHidden"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        instock = try values.decodeIfPresent(Bool.self, forKey: .instock)
        quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
        stepperHidden = try values.decodeIfPresent(Bool.self, forKey: .stepperHidden)
    }
}

struct Cat6 : Codable {
    let name : String?
    let price : Int?
    let instock : Bool?
    var quantity : Int?
    var stepperHidden : Bool?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case price = "price"
        case instock = "instock"
        case quantity = "quantity"
        case stepperHidden = "stepperHidden"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        instock = try values.decodeIfPresent(Bool.self, forKey: .instock)
        quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
        stepperHidden = try values.decodeIfPresent(Bool.self, forKey: .stepperHidden)
    }
}
