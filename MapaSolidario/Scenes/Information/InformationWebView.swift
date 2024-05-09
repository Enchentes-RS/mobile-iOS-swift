//
//  InformationWebView.swift
//  Mapa Solidário
//
//  Created by Rodrigo Henrique Torres Cavalcanti on 09/05/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

struct InformationWebView: View {
    var body: some View {
        WebView(url: URL(string: "https://infos.sosriograndedosul-dev.workers.dev/")!)
    }
}
