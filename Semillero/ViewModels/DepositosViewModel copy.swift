//
//  DepositosViewModel.swift
//  Semillero
//
//  Created by user217123 on 6/12/22.
//

import Foundation
import Foundation
import Combine
import FirebaseFirestore

class DepositosViewModel: ObservableObject{
    
    @Published var depositos = [Deposito]()
    
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
            listenerRegistration = db.collection("depositolista").addSnapshotListener{ (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else{
                print("No documents")
                return
            }
                self.depositos = documents.compactMap{
                    queryDocumentSnapshot in try? queryDocumentSnapshot.data(as: Deposito.self)
                }
            }
        }
    }
}
