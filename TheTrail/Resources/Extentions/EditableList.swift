//
//  EditableList.swift
//  TheTrail
//
//  Created by Will Morrow on 3/1/22.
//

import SwiftUI

struct EditableList<Element: Identifiable, Content: View>: View {
    @Binding var data: [Element]
    var content: (Binding<Element>) -> Content

    init(_ data: Binding<[Element]>,
         content: @escaping (Binding<Element>) -> Content) {
        self._data = data
        self.content = content
    }

    var body: some View {
        ForEach($data, content: content)
            .onMove { indexSet, offset in
                data.move(fromOffsets: indexSet, toOffset: offset)
            }
            .onDelete { indexSet in
                data.remove(atOffsets: indexSet)
            }
        //.toolbar { EditButton() }
    }
}
