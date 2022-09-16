//
//  BorderLabeledTextField.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 28.08.2022.
//

import SwiftUI

struct BorderLabeledTextField: View {
    var label: LocalizedStringKey
    var hint: LocalizedStringKey
    @Binding var text: String
    var onTextChanged: (String) -> Void
    
    @FocusState private var isFocused
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if !text.isEmpty {
                Text(label)
                    .font(.subheadline)
                    .padding(.leading, 10)
                    .padding(.top, -9)
#if os(iOS)
                    .background(Color(UIColor.systemBackground))
#endif
            }
            
            TextField(hint, text: $text)
                .focused($isFocused)
                .autocorrectionDisabled()
#if os(iOS)
                .autocapitalization(.none)
                .keyboardType(.decimalPad)
                .textContentType(.oneTimeCode)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color.gray, lineWidth: 1)
                )
#elseif os(macOS)
                .textFieldStyle(.roundedBorder)
#endif
                .onChange(of: text) { value in
                    if isFocused {
                        onTextChanged(value)
                    }
                }
        }
    }
}

struct BorderLabeledTextField_Previews: PreviewProvider {
    
    @State static var text = "1"
    
    static var previews: some View {
        BorderLabeledTextField(
            label: "Линия",
            hint: "Введите значение в линиях",
            text: $text,
            onTextChanged: { value in }
        )
    }
}
