//
//  ViewController.swift
//  Symbolize
//
//  Created by Murilo Araujo on 10/06/20.
//  Copyright © 2020 Murilo Araujo. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var filePathTextField: NSTextField!
    @IBOutlet weak var firstTextField: NSTextField!
    @IBOutlet weak var secondTextField: NSTextField!
    @IBOutlet var resultTextView: NSTextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Simbolize"
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func fileSelectButtonTapped(_ sender: Any) {
        var openPanel = NSOpenPanel();
        openPanel.allowsMultipleSelection = false;
        openPanel.canChooseDirectories = false;
        openPanel.canCreateDirectories = false;
        openPanel.canChooseFiles = true;
        let i = openPanel.runModal();
        if(i == NSApplication.ModalResponse.OK){
            print(openPanel.url?.absoluteString);
            filePathTextField.stringValue = openPanel.url?.absoluteString ?? "error"
        }
    }
    
    private func layoutSubviews() {
        
    }
    
    @IBAction func runButtonTapped(_ sender: Any) {
        let path = "Downloads/\(filePathTextField.stringValue)"
        let command = AtosService.makeCommand(arch: "arm64", dsymPath: path, firstParam: secondTextField.stringValue, secondParam: firstTextField.stringValue)
        let output = Terminal.run(command)
        resultTextView.string = output
    }
    
}

