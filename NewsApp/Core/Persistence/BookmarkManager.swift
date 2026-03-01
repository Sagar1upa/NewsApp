//
//  BookmarkManager.swift
//  NewsApp
//
//  Created by Sagar Upadhyay on 28/02/26.
//

import Foundation
import CoreData

final class BookmarkManager: BookmarkManaging {

    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        self.context = context
    }

    func save(article: Article) throws {
        guard !isBookmarked(article: article) else { return }

        let entity = BookmarkEntity(context: context)
        entity.id = article.id
        entity.title = article.title
        entity.desc = article.description
        entity.url = article.url
        entity.image = article.image
        entity.source = article.source?.name
        entity.publishedAt = article.publishedAt

        try context.save()
    }

    func delete(article: Article) throws {
        let request: NSFetchRequest<BookmarkEntity> = BookmarkEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", article.id ?? "")

        let results = try context.fetch(request)
        results.forEach { context.delete($0) }

        try context.save()
    }

    func fetchBookmarks() throws -> [BookmarkEntity] {
        let request: NSFetchRequest<BookmarkEntity> = BookmarkEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "publishedAt", ascending: false)]
        return try context.fetch(request)
    }

    func isBookmarked(article: Article) -> Bool {
        let request: NSFetchRequest<BookmarkEntity> = BookmarkEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", article.id ?? "")

        let count = (try? context.count(for: request)) ?? 0
        return count > 0
    }
}
