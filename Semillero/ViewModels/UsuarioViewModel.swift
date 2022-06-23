//
//  CuentaViewModel.swift
//  Semillero
//
//  Created by user217123 on 6/12/22.
//


//  Created by user217123 on 6/12/22.
//

import Foundation
import Combine
import FirebaseFirestore

class UsuarioViewModel: ObservableObject{
    
    @Published var usuario : Usuario
    @Published var modified = false
    @Published var saldo = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(usuario   : Usuario = Usuario(idCuenta: "", fecha: "", saldo: "" , bono: "", tipo: "")){
        self.usuario   = usuario
        self.$usuario
            .dropFirst()
            .sink {
                [weak self] usuario in
                self?.modified = true
                
            }
            .store(in: &self.cancellables)
    }
/// Base Datos
    private  var db = Firestore.firestore()
    private func addUsuario(_ usuario  : Usuario){
        do{
            let _ = try db.collection("usuario").addDocument(from: usuario)
            ///saldo += deposito.cantidad
            
        }
        catch{
            print(error)
        }
    }
    
    private func updateUsuario(_ usuario: Usuario){
        if let documentId = usuario.id {
            do{
                try db.collection("usuario").document(documentId).setData(from: usuario)
            }
            catch{
                print(error)
            }
        }
    }
    private func updateOrAddUsuario(){
        if let _ = usuario.id {
            self.updateUsuario(self.usuario)
        }else{
            addUsuario(usuario)
        }
    }
    private func removeUsuario(){
        if let documentId = usuario
            .id {
            db.collection("usuario").document(documentId).delete { error in
                if let error = error{
                    print(error.localizedDescription)
                }
                
            }
        }
    }
    func handleDoneTapped(){
            self.updateOrAddUsuario()
        }
    func handleDeleteTappend(){
        self.removeUsuario()
    }
    }
