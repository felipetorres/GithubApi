import XCTest
import KIF
@testable import GithubApi

extension ViewControllerTests {
    
    func testShouldAddLinesOnScroll() {
        let linesInPage = 30
        
        let tableView = tester().waitForView(withAccessibilityIdentifier: "tableView") as! UITableView
        
        tester().waitForCell(at: IndexPath(row: 0, section: 0), in: tableView)
        let rows = tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(rows, linesInPage)
        
        let lastRow = rows - 1
        let path = IndexPath(row: lastRow, section: 0)
        tableView.scrollToRow(at: path, at: .bottom, animated: false)
        
        tester().waitForCell(at: IndexPath(row: linesInPage + 1, section: 0), in: tableView)
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), linesInPage * 2)
    }
}
