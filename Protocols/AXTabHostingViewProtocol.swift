//
//  AXTabHostingViewProtocol.swift
//  Malvon Debug
//
//  Created by Ashwin Paudel on 2024-12-21.
//

import AppKit

protocol AXTabHostingViewDelegate: AnyObject {
    // WebView Navigation Functions
    func tabHostingViewReloadCurrentPage()
    func tabHostingViewNavigateForward()
    func tabHostingViewNavigateBackwards()

    func tabHostingViewCreatedNewTab()

    // Browsing Functions
    func tabHostingViewDisplaysTabGroupCustomizationPanel(_ sender: NSView)
    func tabHostingViewDisplaysWorkspaceSwapperPanel(_ sender: NSView)
}

protocol AXTabHostingViewProtocol: AnyObject {
    var tabHostingDelegate: AXTabHostingViewDelegate? { get set }
    var tabGroupInfoView: AXTabGroupInfoView { get }
    var searchButton: AXSidebarSearchButton { get set }

    var tabBarView: AXTabBarViewTemplate { get }

    init(tabBarView: AXTabBarViewTemplate)
}
