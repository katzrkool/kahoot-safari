//
//  ContentView.swift
//  Kahoot Keyboard Shortcuts
//
//  Created by Lucas Kellar on 2020-10-03.
//

import SwiftUI
import SafariServices.SFSafariApplication
let appName = "Kahoot Keyboard Shortcuts"
let extensionBundleIdentifier = "org.lkellar.kahoot.extension"

struct ContentView: View {
    @State var extensionEnabled: Bool = false
    var body: some View {
        VStack {
            Image("Icon")
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
            Text("Kahoot Keyboard Shortcuts").font(.headline)
            Text("Open Safari Preferences to enable the extension and set your shortcuts.")
                .font(.footnote)
                .lineLimit(4)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .multilineTextAlignment(.center)
            Text("On kahoot.it, click the extension icon in the menu bar and hit \"Allow for this Website\" to activate the extension. (If you see the set shortcuts fields, the extension is already activated)")
                .font(.footnote)
                .lineLimit(4)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .multilineTextAlignment(.center)
            Text("The extension will not work until activated.")
                .font(.footnote)
                .bold()
                .lineLimit(3)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .multilineTextAlignment(.center)
            Button("Quit and Open Safari Extension Preferences", action: {
                SFSafariApplication.showPreferencesForExtension(withIdentifier: extensionBundleIdentifier) { error in
                    guard error == nil else {
                        // Insert code to inform the user that something went wrong.
                        return
                    }
                    DispatchQueue.main.async {
                        NSApplication.shared.terminate(nil)
                    }
                }
            })
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
