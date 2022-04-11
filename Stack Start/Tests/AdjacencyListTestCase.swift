import XCTest
@testable import DataStructures


final class AdjacencyListTestCase: XCTestCase {
  func test_description() {
    var graph = AdjacencyList<String>()

    let singapore = graph.addVertex("Singapore")
    let tokyo = graph.addVertex("Tokyo")
    let hongKong = graph.addVertex("Hong Kong")
    let detroit = graph.addVertex("Detroit")
    let sanFrancisco = graph.addVertex("San Francisco")
    let washingtonDC = graph.addVertex("Washington, D.C.")
    let austinTexas = graph.addVertex("Austin")
    let seattle = graph.addVertex("Seattle")

    for edge in [
      GraphEdge(source: singapore, destination: hongKong, weight: 300),
      GraphEdge(source: singapore, destination: tokyo, weight: 500),
      GraphEdge(source: hongKong, destination: tokyo, weight: 250),
      GraphEdge(source: tokyo, destination: detroit, weight: 450),
      GraphEdge(source: tokyo, destination: washingtonDC, weight: 300),
      GraphEdge(source: hongKong, destination: sanFrancisco, weight: 600),
      GraphEdge(source: detroit, destination: austinTexas, weight: 50),
      GraphEdge(source: austinTexas, destination: washingtonDC, weight: 292),
      GraphEdge(source: sanFrancisco, destination: washingtonDC, weight: 337),
      GraphEdge(source: washingtonDC, destination: seattle, weight: 277),
      GraphEdge(source: sanFrancisco, destination: seattle, weight: 218),
      GraphEdge(source: austinTexas, destination: sanFrancisco, weight: 297)
    ] {
      graph.add(edge)
    }

    XCTAssertEqual(
      "\(graph)",
      """
        0: Singapore -> Tokyo (500.0)
                        Hong Kong (300.0)

        1: Tokyo -> Singapore (500.0)
                    Hong Kong (250.0)
                    Detroit (450.0)
                    Washington, D.C. (300.0)

        2: Hong Kong -> Singapore (300.0)
                        Tokyo (250.0)
                        San Francisco (600.0)

        3: Detroit -> Tokyo (450.0)
                      Austin (50.0)

        4: San Francisco -> Hong Kong (600.0)
                            Washington, D.C. (337.0)
                            Austin (297.0)
                            Seattle (218.0)

        5: Washington, D.C. -> Tokyo (300.0)
                               San Francisco (337.0)
                               Austin (292.0)
                               Seattle (277.0)

        6: Austin -> Detroit (50.0)
                     San Francisco (297.0)
                     Washington, D.C. (292.0)

        7: Seattle -> San Francisco (218.0)
                      Washington, D.C. (277.0)
        """
    )
  }
}
