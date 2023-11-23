//
//  NewManager.swift
//  Core Data
//
//  Created by Kamal on 2023-11-22.
//

import CoreData

class NoteManager {

    static let shared = NoteManager()

    private init() {}

    func createNote(title: String, content: String, context: NSManagedObjectContext) {
        let note = Note(context: context)
        note.title = title
        note.content = content
        note.timestamp = Date()

        do {
            try context.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }

    func fetchNotes(context: NSManagedObjectContext) -> [Note] {
        let fetchRequest: NSFetchRequest<Note> = Note.fetchRequest()

        do {
            return try context.fetch(fetchRequest)
        } catch {
            return []
        }
    }

    func updateNote(_ note: Note, title: String, content: String, context: NSManagedObjectContext) {
        note.title = title
        note.content = content
        note.timestamp = Date()

        do {
            try context.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }

    func deleteNote(_ note: Note, context: NSManagedObjectContext) {
        context.delete(note)

        do {
            try context.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
}
