//
//  ContentView.swift
//  GStreamerSwift
//
//  Created by 김수진 on 3/25/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var gstreamerVersion: String = ""
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("GStreamer version: \(gstreamerVersion)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .onAppear {
            fetchGStreamerVersion()
        }
    }
    
    func fetchGStreamerVersion() {
        var argc = CommandLine.argc
        var argv = CommandLine.unsafeArgv

        // 포인터 타입 변환
        var unsafeArgv: UnsafeMutablePointer<UnsafeMutablePointer<CChar>?>?
        argv.withMemoryRebound(to: UnsafeMutablePointer<CChar>?.self, capacity: Int(argc)) {
            unsafeArgv = $0
        }

        gst_init(&argc, &unsafeArgv)

        if let version = String(cString: gst_version_string(), encoding: .utf8) {
            gstreamerVersion = version
            print("GStreamer version: \(version)")
        }
    }
}

#Preview {
    ContentView()
}
