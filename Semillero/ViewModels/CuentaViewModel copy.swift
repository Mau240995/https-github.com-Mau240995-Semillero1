//
//  CuentaViewModel.swift
//  Semillero
//
//  Created by user217123 on 6/12/22.
//

import Foundation
import Combine
import FirebaseFirestore

class CuentaViewModel: ObservableObject{
    
    @Published var cuenta: Cuenta
    @Published var modified = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init(cuenta: Cuenta = Cuenta(idCuenta: "", fecha: "", saldo: "", tipo: "")){
        self.cuenta = cuenta
        self.$cuenta
            .dropFirst()
            .sink {
                [weak self] cuenta in
                self?.modified = true
                
            }
            .store(in: &self.cancellables)
    }
/// Base Datos
    private  var db = Firestore.firestore()
    private func addCuenta(_ cuenta: Cuenta){
        do{
            let _ = try db.collection("cuentalista").addDocument(from: cuenta)
        }
        catch{
            print(error)
        }
    }
    
}
