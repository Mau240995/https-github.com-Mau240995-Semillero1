//
//  CuentaDetailsView.swift
//  Semillero
//
//  Created by user217123 on 6/12/22.
//

import SwiftUI


struct UsuarioDetailsView: View {
    
    @Environment (\.presentationMode)  var presentationMode
    @State var presentEditUsuarioSheet = false
    
    private func  editButton(action: @escaping () -> Void ) -> some View {
        Button(action: {action() }) {
            Text("Edit")
        }
    }
    var usuario: Usuario
    
    var body: some View {
        Form {
            Section(header: Text("Usuario")){
                Text(usuario.idCuenta)
                Text(usuario.fecha)
                Text(usuario.saldo) 
                Text(usuario.bono)
                //Text(usuario.bonoAsignado)
                Text(usuario.tipo)
                
            }
        }
        .navigationBarTitle(usuario.idCuenta)
        .navigationBarItems(trailing: editButton {
            self.presentEditUsuarioSheet.toggle()
        })
        .onAppear(){
            print("usuario details.onapper()\(self.usuario.idCuenta)")
        }
        .onDisappear(){
            print("Usuarios details.onDispacher")
        }
        
    }
}

struct UsuarioDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let usuario = Usuario(idCuenta: "Numero de cuenta", fecha: "Fecha", saldo: "Saldo", bono: "bono", tipo: "Tipo")
        return
        NavigationView{
            UsuarioDetailsView(usuario : usuario)
        }
    }
}
