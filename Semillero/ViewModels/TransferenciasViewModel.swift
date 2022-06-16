//
//  TransferenciasViewModel.swift
//  Semillero
//
//  Created by user217123 on 6/13/22.
//

import Foundation
import Combine
import FirebaseFirestore

class TransferenciasViewModel: ObservableObject{
    
    @Published var transferencias = [Transferencia]()
    
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
            listenerRegistration = db.collection("transferencialista").addSnapshotListener{ (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else{
                print("No documents")
                return
            }
                self.transferencias = documents.compactMap{
                    queryDocumentSnapshot in try? queryDocumentSnapshot.data(as: Transferencia.self)
                }
            }
        }
    }
}
