import XCTest
import KIF
@testable import GithubApi

class ViewControllerTests: KIFTestCase {
    
    func testShouldRefreshViewOnPullingDown() {
        let vc = ViewController()
        vc.vm = ViewModel(repository: MockRepository())
        UIApplication.shared.keyWindow?.rootViewController = vc
        tester().waitForAnimationsToFinish()
        
        let tableView = tester().waitForView(withAccessibilityIdentifier: "tableView") as! UITableView
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 0)
        
        tester().pullToRefreshView(withAccessibilityIdentifier: "tableView", pullDownDuration: .inAboutAHalfSecond)
        tester().waitForCell(at: IndexPath(row: 0, section: 0), in: tableView)
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
    }
}
