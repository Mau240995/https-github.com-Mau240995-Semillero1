//
//  Transferencia.swift
//  Semillero
//
//  Created by user217123 on 6/13/22.
//


import Foundation
import FirebaseFirestoreSwift

struct Transferencia: Identifiable, Codable {
    
    @DocumentID var id: String?
    var cantidad: String
    var descripcion: String
    var numeroCuenta: String

    
    enum CodingKeys: String, CodingKey {
        case id
        case cantidad
        case descripcion
        case numeroCuenta
    }
}
