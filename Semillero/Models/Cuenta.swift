//
//  Cuenta.swift
//  Semillero
//
//  Created by user217123 on 6/12/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Cuenta: Identifiable, Codable {
    
    @DocumentID var id: String?
    var idCuenta: String
    var fecha: String
    var saldo: String
    var tipo: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case idCuenta
        case fecha
        case saldo
        case tipo
    }
}


