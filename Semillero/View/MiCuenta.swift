//
//  MiCuenta.swift
//  Semillero
//
//  Created by user217123 on 6/22/22.
//

import SwiftUI

struct MiCuenta: View {
    @StateObject var viewModel =  UsuariosViewModel()
    @StateObject var viewModelD = DepositosViewModel()
    @State var  presentAddUsuarioSheet = false
    
    private var addButton: some  View {
        
        Button (action:{
            self.presentAddUsuarioSheet.toggle()
        }){
            Image(systemName: "plus")
        }
    }
   
    private func usuarioRowView(usuario: Usuario) -> some View{

            VStack(alignment: .leading){
                Text("Num. de Cuenta : \(usuario.idCuenta)")
                Text("Saldo Disponible : $ \(usuario.saldo)")
                Text("Fecha de Apertura : \(usuario.fecha)")
                Text("Tipo de Cuenta : \(usuario.tipo)")

        }
    }
    var body: some View {
        NavigationView{
            List {
                ForEach(viewModel.usuarios){ usuario in
                    usuarioRowView(usuario: usuario)
                
                }
            }
            .navigationTitle(" Mi Cuenta")
            
            .onAppear(){
               print("Cuenta")
                self.viewModel.subcribe()
                self.viewModelD.subcribe()
            }
                    }
    }
}

struct MiCuenta_Previews: PreviewProvider {
    static var previews: some View {
        MiCuenta()
    }
}
