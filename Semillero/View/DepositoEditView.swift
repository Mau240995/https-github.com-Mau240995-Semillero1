//
//  DepositoEditView.swift
//  Semillero
//
//  Created by user217123 on 6/13/22.
//

import SwiftUI
enum Mode {
    case new
    case edit
}
enum  Action {
    case delete
    case done
    case cancel
}
struct DepositoEditView: View {
    @Environment(\.presentationMode) private var presentationMode
    @State var presentActionSheet =  false
    @ObservedObject var viewModelD = DepositoViewModel()
    
    var mode : Mode = .new
    var completionHandler: ((Result<Action, Error>) -> Void)?
    var cancelButton: some View{
        Button(action: {
            self.handleCancelTapped()
        }) {
            Text("Cancelar")
        }
    }
    var saveButton: some View{
        Button(action:{
            self.handleDoneTapped()
        }) {
            Text(mode == .new ? "Done" : "Save")
        }
        .disabled(!viewModelD.modified)
    }
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Deposito")){
                    TextField("Cantidad",text: $viewModelD.deposito.cantidad)
                    TextField("Descripcion",text: $viewModelD.deposito.descripcion)
                }
                if mode == .edit{
                    Section{
                        Button("Eliminar"){
                            self.presentActionSheet.toggle()
                        }
                        .foregroundColor(.red)
                    }
                }
                
            }
            .navigationTitle(mode == .new ? "New deposito" : viewModelD.deposito.descripcion)
            .navigationBarTitleDisplayMode(mode == .new ? .inline: .large)
            .navigationBarItems(
                leading: cancelButton,
            trailing : saveButton
            )
            .actionSheet(isPresented: $presentActionSheet){
                ActionSheet(title: Text("Esta Seguro ?"),
                            buttons: [
                                .destructive(Text("Eliminar Deposito"),
                                             action: {
                                                 self.handleDeleteTappen()
                                             }),
                                .cancel()
                            ])
            }
        }
    }
    func handleCancelTapped(){
        self.dismiss()
    }
    func handleDeleteTappen(){
        viewModelD.handleDeleteTappend()
        self.dismiss()
        self.completionHandler?(.success(.delete))
    }
    func dismiss(){
        self.presentationMode.wrappedValue.dismiss()
    }
    func handleDoneTapped(){
        self.viewModelD.handleDoneTapped()
        dismiss()
    }
    
}

struct DepositoEditView_Previews: PreviewProvider {
    static var previews: some View {
        let deposito = Deposito(cantidad: "simple title", descripcion: "Descripcion")
        let depositoViewModel = DepositoViewModel(deposito: deposito)
        
        return DepositoEditView(viewModelD: depositoViewModel, mode: .edit)
    }
}
