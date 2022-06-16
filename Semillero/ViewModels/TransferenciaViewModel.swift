//
//  TransferenciaViewModel.swift
//  Semillero
//
//  Created by user217123 on 6/13/22.
//

import Foundation
import Combine
import FirebaseFirestore

class TransferenciaViewModel: ObservableObject{
    
    @Published var transferencia: Transferencia
    @Published var modified = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init(transferencia: Transferencia = Transferencia(cantidad: "", descripcion: "",numeroCuenta: "")){
        self.transferencia = transferencia
        self.$transferencia
            .dropFirst()
            .sink {
                [weak self] transferencia in
                self?.modified = true
                
            }
            .store(in: &self.cancellables)
    }
/// Base Datos
    private  var db = Firestore.firestore()
    private func addTransferencia(_ transferencia: Transferencia){
        do{
            let _ = try db.collection("transferencialista").addDocument(from: transferencia)
        }
        catch{
            print(error)
        }
    }
    
    private func updateTransferencia(_ transferencia: Transferencia){
        if let documentId = transferencia.id {
            do{
                try db.collection("transferencialista").document(documentId).setData(from: transferencia)
            }
            catch{
                print(error)
            }
        }
    }
    private func updateOrAddTransferencia(){
        if let _ = transferencia.id {
            self.updateTransferencia(self.transferencia)
        }else{
            addTransferencia(transferencia)
        }
    }
    private func removeTransferencia(){
        if let documentId = transferencia.id {
            db.collection("transferencialista").document(documentId).delete { error in
                if let error = error{
                    print(error.localizedDescription)
                }
                
            }
        }
    }
    func handleDoneTapped(){
            self.updateOrAddTransferencia()
        }
    func handleDeleteTappend(){
        self.removeTransferencia()
    }
    }
    

