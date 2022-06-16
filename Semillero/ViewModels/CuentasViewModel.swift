//
//  CuentasViewModel.swift
//  Semillero
//
//  Created by user217123 on 6/12/22.
//

import Foundation
import Combine
import FirebaseFirestore

class CuentasViewModel: ObservableObject{
    
    @Published var cuentas = [Cuenta]()
    
    private var db = Firestore.firestore()
    
    private var listenerRegistration: ListenerRegistration?
    
    deinit{
        unsubscribe()
    }
    func unsubscribe(){
        if listenerRegistration == nil{
            listenerRegistration?.remove()
            listenerRegistration = nil
        }
    }
    func subcribe(){
        if listenerRegistration == nil{
            listenerRegistration = db.collection("cuentalista").addSnapshotListener{ (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else{
                print("No documents")
                return
            }
                self.cuentas = documents.compactMap{
                    queryDocumentSnapshot in try? queryDocumentSnapshot.data(as: Cuenta.self)
                }
            }
        }
    }
}
