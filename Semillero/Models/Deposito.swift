//
//  Deposito.swift
//  Semillero
//
//  Created by user217123 on 6/12/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Deposito: Identifiable, Codable {
    
    @DocumentID var id: String?
    var cantidad: String
    var descripcion: String

    
    enum CodingKeys: String, CodingKey {
        case id
        case cantidad
        case descripcion
    }
}


