/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Le Hong Thai
  ID: s3752577
  Created  date: 31/7/2023
  Last modified: 7/8/2023
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

struct OrderRowView: View {
    
    @Binding var order:OrderItem
    @ObservedObject var orders:OrderModel
    @State private var isShowingSheet = false
    
    var body: some View {
        VStack () {
            HStack {
                Text("\(order.bookItem.name)")
                    .font(.system(size: 15))
                    .foregroundColor(Color("DarkGold"))
                Spacer()
            }
            
            HStack(alignment:.firstTextBaseline){
                HStack (spacing: 0) {
                    Text ("Quantity: ")
                    Text (order.quantity, format: .number)
                }
                .font(.system(size: 13))
                .italic()
                
                Button(action: {
                    isShowingSheet = true
                }){
                    Image(systemName: "trash")
                        .foregroundColor(Color("DarkGold"))
                        .font(.system(size: 14))
                        .padding(.leading , 4)

                }
                .actionSheet(isPresented: $isShowingSheet) {
                    ActionSheet(
                        title: Text("Do you want to permanently remove this order"),
                        message: Text("You can't undo this action."),
                        buttons:[
                            .destructive(Text("Remove Order"),
                                         action: removeOrder),
                            .cancel()
                        ]
                    )}
                Spacer()
                
                Text(order.extPrice, format: .currency(code: "VND"))
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(Color("OrangePeel"))
            }
            .padding(.top, -8)
        }
        .padding([.trailing, .leading], 8)
        .frame(height: 50)
        .fontDesign(.serif)
    }
    
    func removeOrder() {
        orders.removeOrderById(id: order.id)
    }
}

struct OrderRowView_Previews: PreviewProvider {
    static var previews: some View {
        OrderRowView(order: .constant(testOrderItem), orders: OrderModel())
    }
}
