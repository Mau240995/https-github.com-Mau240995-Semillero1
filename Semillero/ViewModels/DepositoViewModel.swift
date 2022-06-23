//
//  DepositoViewModel.swift
//  Semillero
//
//  Created by user217123 on 6/12/22.
//

import Foundation
import Combine
import FirebaseFirestore

class DepositoViewModel: ObservableObject{
    
    @Published var deposito: Deposito
    @Published var modified = false
    @Published var saldo = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(deposito: Deposito = Deposito(cantidad: "", descripcion: "")){
        self.deposito = deposito
        self.$deposito
            .dropFirst()
            .sink {
                [weak self] deposito in
                self?.modified = true
                
            }
            .store(in: &self.cancellables)
    }
/// Base Datos
    private  var db = Firestore.firestore()
    private func addDeposito(_ deposito: Deposito){
        do{
            let _ = try db.collection("depositolista").addDocument(from: deposito)
            ///saldo += deposito.cantidad
            
        }
        catch{
            print(error)
        }
    }
    
    private func updateDeposito(_ deposito: Deposito){
        if let documentId = deposito.id {
            do{
                try db.collection("depositolista").document(documentId).setData(from: deposito)
            }
            catch{
                print(error)
            }
        }
    }
    private func updateOrAddDeposito(){
        if let _ = deposito.id {
            self.updateDeposito(self.deposito)
        }else{
            addDeposito(deposito)
        }
    }
    private func removeDeposito(){
        if let documentId = deposito.id {
            db.collection("depositolista").document(documentId).delete { error in
                if let error = error{
                    print(error.localizedDescription)
                }
                
            }
        }
    }
    func handleDoneTapped(){
            self.updateOrAddDeposito()
        }
    func handleDeleteTappend(){
        self.removeDeposito()
    }
    }



