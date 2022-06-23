//
//  ListaTransferencias.swift
//  Semillero
//
//  Created by user217123 on 6/13/22.
//

import SwiftUI

struct ListaTransferencias: View {
    @StateObject var viewModel =  UsuariosViewModel()
    @StateObject var viewModelT = TransferenciasViewModel()
    @State var  presentAddTransferenciaSheet = false
    
    private var addButton: some  View {
        
        Button (action:{
            self.presentAddTransferenciaSheet.toggle()
        }){
            Image(systemName: "plus")
        }
    }
   
    private func transferenciaRowView(transferencia: Transferencia) -> some View{
        NavigationLink(destination: TransferenciaDetailsView(transferencia: transferencia)){
            VStack(alignment: .leading){
                Text("Cantidad: $ \(transferencia.cantidad)")
                Text("Descripcion: \(transferencia.descripcion)")
                Text("Numero de Cuenta : \(transferencia.numeroCuenta)")
            }
        }
    }
    var body: some View {
        NavigationView{
            List {
                ForEach(viewModelT.transferencias){ transferencia in
                    transferenciaRowView(transferencia: transferencia)
                }
            }
            .navigationTitle("Transferencias")
            .navigationBarItems(trailing: addButton)
            .onAppear(){
               print("Transferencias List View")
                self.viewModel.subcribe()
                self.viewModelT.subcribe()
            }
            .sheet(isPresented: self.$presentAddTransferenciaSheet) {
                TransferenciaEditView()
            }
        }
    }
}

struct ListaTransferenciass_Previews: PreviewProvider {
    static var previews: some View {
        ListaTransferencias()
    }
}
