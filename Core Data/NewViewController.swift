//
//  NewViewController.swift
//  Core Data
//
//  Created by Kamal on 2023-11-22.
//

import UIKit
import CoreData

class NewViewController: UIViewController {

    let noteManager = NoteManager.shared

    // Example ViewController methods

    func createNoteButtonTapped() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        noteManager.createNote(title: "New Note", content: "", context: context)
        updateUI()
    }

    func updateUI() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let notes = noteManager.fetchNotes(context: context)
        // Update your UI elements with the 'notes' array
    }

    // Implement UITableViewDataSource and UITableViewDelegate methods for displaying notes in a table view.

}

