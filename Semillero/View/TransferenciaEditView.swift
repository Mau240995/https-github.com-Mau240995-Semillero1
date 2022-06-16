//
//  TransferenciaEditView.swift
//  Semillero
//
//  Created by user217123 on 6/13/22.
//


import SwiftUI
enum ModeT {
    case new
    case edit
}
enum  ActionT {
    case delete
    case done
    case cancel
}
struct TransferenciaEditView: View {
    @Environment(\.presentationMode) private var presentationMode
    @State var presentActionSheet =  false
    @ObservedObject var viewModelT = TransferenciaViewModel()
    
    var modeT : ModeT = .new
    var completionHandler: ((Result<Action, Error>) -> Void)?
    var cancelButton: some View{
        Button(action: {
            self.handleCancelTapped()
        }) {
            Text("Cancel")
        }
    }
    var saveButton: some View{
        Button(action:{
            self.handleDoneTapped()
        }) {
            Text(modeT == .new ? "Done" : "Save")
        }
        .disabled(!viewModelT.modified)
    }
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Transferencias")){
                    TextField("Cantidad",text: $viewModelT.transferencia.cantidad)
                    TextField("Descripcion",text: $viewModelT.transferencia.descripcion)
                    TextField("Numero de Cuenta",text: $viewModelT.transferencia.numeroCuenta)                }
                if modeT == .edit{
                    Section{
                        Button("Delete"){
                            self.presentActionSheet.toggle()
                        }
                        .foregroundColor(.red)
                    }
                }
                
            }
            .navigationTitle(modeT == .new ? "Nueva Transferencia " : viewModelT.transferencia.descripcion)
            .navigationBarTitleDisplayMode(modeT == .new ? .inline: .large)
            .navigationBarItems(
                leading: cancelButton,
            trailing : saveButton
            )
            .actionSheet(isPresented: $presentActionSheet){
                ActionSheet(title: Text("Are you sourse?"),
                            buttons: [
                                .destructive(Text("Delete Transferencia"),
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
        viewModelT.handleDeleteTappend()
        self.dismiss()
        self.completionHandler?(.success(.delete))
    }
    func dismiss(){
        self.presentationMode.wrappedValue.dismiss()
    }
    func handleDoneTapped(){
        self.viewModelT.handleDoneTapped()
        dismiss()
    }
    
}

struct TransferenciaEditView_Previews: PreviewProvider {
    static var previews: some View {
        let transferencia = Transferencia(cantidad: "Simple title", descripcion: "Descripcion",numeroCuenta: "Numero De Cuenta")
        let transferenciaViewModel = TransferenciaViewModel(transferencia: transferencia)
        
        return TransferenciaEditView(viewModelT: transferenciaViewModel, modeT: .edit)
    }
}
