//
//  VerticallyLabeledContent.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 28.08.2022.
//

import SwiftUI

struct VerticallyLabeledTextField: View {
    
    var label: LocalizedStringKey
    var labelFont: Font = .headline
    var prompt: LocalizedStringKey
    var promptFont: Font = .body
    @Binding var text: String
    var onTextChanged: (String) -> Void
    
    @FocusState private var isFocused
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(labelFont)
            
            ZStack(alignment: .trailing) {
                TextField(
                    text: $text,
                    prompt: Text(prompt)
                        .font(promptFont),
                    label: {}
                )
                    .focused($isFocused)
                    .autocorrectionDisabled()
#if os(iOS)
                    .autocapitalization(.none)
                    .keyboardType(.decimalPad)
                    .padding(10)
                    .overlay(overlay)
#elseif os(macOS)
                    .textFieldStyle(.roundedBorder)
#endif
                    .onChange(of: text) { value in
                        if isFocused {
                            onTextChanged(value)
                        }
                    }
                
#if os(iOS)
                if isFocused && !text.isEmpty {
                    Image(systemName: "xmark.circle.fill")
                        .padding(.trailing, 10)
                        .onTapGesture {
                            text = ""
                        }
                }
#endif
            }
        }
    }
    
#if os(iOS)
    var overlay: some View {
        VStack {
            if isFocused {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color.blue, lineWidth: 2)
            } else {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            }
        }
    }
#endif
}

#if DEBUG
struct VerticallyLabeledContent_Previews: PreviewProvider {
    
    @State static var text = ""
    
    static var previews: some View {
        VerticallyLabeledTextField(
            label: "Линия",
            prompt: "Введите значение в линиях",
            text: $text,
            onTextChanged: { value in }
        )
    }
}
#endif
