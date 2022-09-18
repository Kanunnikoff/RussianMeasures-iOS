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
    var title: LocalizedStringKey
    var font: Font = .body
    @Binding var text: String
    var onTextChanged: (String) -> Void
    
    @FocusState private var isFocused
    @State private var isEditing: Bool = false
    
    @State private var isCommited: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(labelFont)
            
            ZStack(alignment: .trailing) {
                TextField(
                    title,
                    text: $text,
                    onEditingChanged: { editing in
                        isEditing = editing
                    },
                    onCommit: {
                        isCommited = true
                    }
                )
                .font(font)
                .focused($isFocused)
                .autocorrectionDisabled()
#if os(iOS) || os(tvOS)
                .autocapitalization(.none)
                .keyboardType(.decimalPad)
#endif
#if os(iOS)
                .padding(10)
                .overlay(overlay)
#endif
#if os(macOS)
                .textFieldStyle(.roundedBorder)
#endif
                .onChange(of: text) { value in
                    if isFocused || isEditing || isCommited {
                        isCommited = false
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
            title: "Введите значение в линиях",
            text: $text,
            onTextChanged: { value in }
        )
    }
}
#endif
