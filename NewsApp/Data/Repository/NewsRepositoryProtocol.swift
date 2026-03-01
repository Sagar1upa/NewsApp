//
//  NewsRepositoryProtocol.swift
//  NewsApp
//
//  Created by Sagar Upadhyay on 28/02/26.
//

import Foundation

protocol NewsRepositoryProtocol {
    func fetchTopHeadlines(page: Int) async throws -> [Article]
    func search(query: String, page: Int) async throws -> [Article]
}

final class NewsRepository: NewsRepositoryProtocol {

    private let apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }

    func fetchTopHeadlines(page: Int) async throws -> [Article] {
        let request = Endpoint.topHeadlines(page: page)
        let response: NewsResponse = try await apiClient.request(request)
        print("response ===>>> ", response.articles)
        return response.articles ?? []
//        return mockList
    }

    func search(query: String, page: Int) async throws -> [Article] {
        let request = Endpoint.search(query: query, page: page)
        let response: NewsResponse = try await apiClient.request(request)
        return response.articles ?? []
    }
}


let mockList: [Article] = [

        Article(
            id: "f7eb4794fea92d16ea55d386767da7d3",
            title: "Match Report & Highlights",
            description: "Report and free match highlights as Wolves beat Aston Villa 2-0 at Molineux.",
            content: "The Premier League's bottom club Wolves stunned third-placed Aston Villa with a 2-0 win.",
            url: "https://www.skysports.com/football/wolves-vs-aston-villa/report/531408",
            image: "https://e0.365dm.com/26/02/1600x900/skysports-joao-gomes-wolves_7177211.jpg?20260227214713",
            publishedAt: "2026-02-27T23:48:30Z",
            lang: "eng",
            source: Source(
                id: "375c6022b40a085995083df0ed1ac413",
                name: "Sky Sports",
                url: "https://www.skysports.com"
            )
        ),

        Article(
            id: "9fba8434f488af803e7dc0de1425766d",
            title: "Real reasons Tinubu sacked ex-IG Egbetokun",
            description: "Discover the real reasons President Tinubu sacked ex-IGP Egbetokun.",
            content: "Former Inspector-General of Police, Kayode Egbetokun, was removed from office.",
            url: "https://punchng.com/real-reasons-tinubu-sacked-ex-ig-egbetokun/",
            image: "https://cdn.punchng.com/wp-content/uploads/2023/06/27104038/Olukayode-Egbetokun.jpg",
            publishedAt: "2026-02-27T23:48:15Z",
            lang: "eng",
            source: Source(
                id: "2881b10152726230ad56a8b1c0fa1653",
                name: "Punch Newspapers",
                url: "https://punchng.com"
            )
        ),

        Article(
            id: "df1607515ca6426bc38e07926d7a2181",
            title: "Neil Sedaka, Breaking Up Is Hard to Do singer and pop song hitmaker, dies aged 86",
            description: "Musician died after being taken to hospital in Los Angeles.",
            content: "Neil Sedaka, the singer-songwriter behind Breaking Up Is Hard to Do, has died.",
            url: "https://www.theguardian.com/music/2026/feb/28/neil-sedaka-dies-aged-71-cause-of-death-breaking-up-is-hard-to-do-singer",
            image: "https://i.guim.co.uk/img/media/e2874fe6b075377b4c3b1a1f6d7aeb346ffc6f3b/194_0_3923_3138/master/3923.jpg",
            publishedAt: "2026-02-27T23:48:00Z",
            lang: "eng",
            source: Source(
                id: "558a003a7a0164e924408edec7e99f99",
                name: "The Guardian",
                url: "https://www.theguardian.com"
            )
        ),

        Article(
            id: "6a358c43421b5dcb5de8da28834170de",
            title: "Brazil flooding death toll rises to 64 as search efforts continue",
            description: "Government agency says more extreme weather expected.",
            content: "The death toll from landslides and flooding in eastern Brazil has risen to 64.",
            url: "https://www.aljazeera.com/news/2026/2/27/brazil-flooding-death-toll-rises-to-64-as-search-efforts-continue",
            image: "https://www.aljazeera.com/wp-content/uploads/2026/02/AP26058106594888-1772230270.jpg",
            publishedAt: "2026-02-27T23:46:56Z",
            lang: "eng",
            source: Source(
                id: "7530d90c9af769eda4cb548f32ed381d",
                name: "Al Jazeera",
                url: "https://www.aljazeera.com"
            )
        ),

        Article(
            id: "c05625eabca64a40b3ab25644c75b5b6",
            title: "Enoch Burke seeks permission to bring late appeal",
            description: "Jailed schoolteacher seeks permission from Court of Appeal.",
            content: "In May 2023, Judge Alexander Owens ruled that the school validly suspended Burke.",
            url: "https://www.irishtimes.com/crime-law/courts/2026/02/27/enoch-burke-seeks-permission-to-bring-late-appeal-against-order-banning-him-from-school/",
            image: "https://www.irishtimes.com/resizer/v2/HA6GJZ4WL4VGF3DB4YSDRYK4FU.jpg",
            publishedAt: "2026-02-27T23:45:40Z",
            lang: "eng",
            source: Source(
                id: "735252dcb2793bb57ad34b2a2b258f27",
                name: "The Irish Times",
                url: "https://www.irishtimes.com"
            )
        ),

        Article(
            id: "07c70dd2a3c35bccc0cfb62de6d27c94",
            title: "Review: Citi Rewards Credit Card",
            description: "An easy-to-earn 4 mpd and numerous transfer partners.",
            content: "Here’s The MileLion’s review of the Citi Rewards Card.",
            url: "https://milelion.com/2026/02/27/review-citi-rewards-credit-card/",
            image: "https://milelion.com/wp-content/uploads/2020/06/citi-rewards-hero-5.jpg",
            publishedAt: "2026-02-27T23:44:46Z",
            lang: "eng",
            source: Source(
                id: "d4e68c1de0ceeedd39299b3f37559aaf",
                name: "The MileLion",
                url: "https://milelion.com"
            )
        ),

        Article(
            id: "24b7b2aa45b2f4d914efcb0ce87313eb",
            title: "Mercado-Revilla's twin education reform bills hurdle House panel",
            description: "Cavite 2nd district Rep. upbeat over passage.",
            content: "Recently getting the nod of the House Committee.",
            url: "https://mb.com.ph/2026/02/28/mercado-revillas-twin-education-reform-bills-hurdle-house-panel-54404",
            image: "https://mb.com.ph/manilabulletin/uploads/images/2026/02/27/82517.webp",
            publishedAt: "2026-02-27T23:43:53Z",
            lang: "eng",
            source: Source(
                id: "4041b9d9c6df9db2245d952224650739",
                name: "Manila Bulletin",
                url: "https://mb.com.ph"
            )
        ),

        Article(
            id: "3714192157eb2b868c75fe2c82b785f9",
            title: "Supposedly harmless peptide may be linked to Alzheimer’s disease",
            description: "New paper argues efforts should not ignore P3.",
            content: "New paper from UC Santa Cruz chemistry lab.",
            url: "https://news.ucsc.edu/2026/02/neglected-peptide-p3-alzheimers/",
            image: "https://news.ucsc.edu/wp-content/uploads/2026/02/Neglected-peptide-main.jpg",
            publishedAt: "2026-02-27T23:43:28Z",
            lang: "eng",
            source: Source(
                id: "5cd627b0fd7393db9dba70496bb4ab83",
                name: "UC Santa Cruz - News",
                url: "https://news.ucsc.edu"
            )
        ),

        Article(
            id: "b9d261d91fb26d603468259aaf794280",
            title: "Black Caps hold breath after loss to England",
            description: "New Zealand failed to clinch semifinal place.",
            content: "New Zealand looked set to join England in the semifinals.",
            url: "https://www.1news.co.nz/2026/02/28/blackcaps-hold-breath-after-loss-to-england-in-world-cup-thriller/",
            image: "https://tvnz-1-news-prod.cdn.arcpublishing.com/resizer/v2/new-zealands-tim-seifert.jpg",
            publishedAt: "2026-02-27T23:42:15Z",
            lang: "eng",
            source: Source(
                id: "9b3921fcecffb9abd8da549eacb0a84a",
                name: "1News",
                url: "https://www.1news.co.nz"
            )
        ),

        Article(
            id: "73b44f0cb427cdfecaac627ce48c202f",
            title: "Hollywood Banned Me After Gaza Ceasefire Speech",
            description: "Susan Sarandon says she was blocked from roles.",
            content: "Susan Sarandon is speaking out about her current film career.",
            url: "https://variety.com/2026/film/news/susan-sarandon-hollywood-ban-gaza-ceasefire-speech-1236675199/",
            image: "https://variety.com/wp-content/uploads/2026/02/P103A590.jpg",
            publishedAt: "2026-02-27T23:42:00Z",
            lang: "eng",
            source: Source(
                id: "c96d85bc8a846b5845a5420fe892ac16",
                name: "Variety",
                url: "https://variety.com"
            )
        )
    ]

