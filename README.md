# Orion Compact Tab Bar Assignment
Took around 4 hours to complete. The code for other parts of this project are private, but you are able to view it via Zoom or Google Meet with me.

## Checklist
- [x] All non selected tabs should share the same width.
- [x] Tabs should become scrollable when the browser is at minimum width.
- [x] When there's less space to fit tabs having minimum width, tabs are expected to be scrollable, and the toolbar item is expected to be visible all the time even on minimum window width by recalculating available width
- [x] Animations (addings tabs, closing tabs) should be as smooth as possible.

## Implementation Details

* **Swift Protocols:** Protocols allow for easy reusing of code. I have been able to create not just compact tabs, but horizontal and vertical tabs as well!

  * `AXTabButton` — A protocol that defines how a tab button is supposed to be created, it has default variables such as `favicon`, `webTitle` and `isSelected`.
  * `AXTabHostingView` — A protocol that holds the tab bar. For example, if you were to use horizontal tabs, you need not only horizontal tabs, but also a toolbar with search fields, navigation buttons and a few browser extensions. The hosting view holds a tab view, and other views such as the search field and the refresh/back/forward buttons.
  * `AXTabBarView` — A protocol that is wrapped around an NSStackView and is the heart of the tab bar, it includes methods such as `addTab` and `removeTab` and displays the tabs in a scrollable manner. It is very flexible and dynamic, and as a result I have also created a vertical and horizontal version of this.
 

## **How do they communicate?**
  * There is a tab bar view, this contains the main tabs. It is responsible for resizing the width of the tabs, addition and subtraction of tabs.
  * There is a tab host view, which includes the tab bar view and includes other components such as the search bar, back/forward/refresh buttons and other buttons. Essentially it is a wrapper that adds additional functionality to the standalone tab bar view.
  * For the compact tabs, the tab bar view communicates to the tab host view and tells it that a specific tab needs to be "stickied" to either the left/right.
  * There is also a tab button, which is a subclass of an NSButton and handles holds the favicon, tab title and close buttons.
  * There is an `AXTab` class which holds the webView, the titleObserver, tab title and tab url
  * `AXTabGroup` includes an array of these, along with tab group colors and icons
  * `AXProfile` includes a `WKWebViewConfiguration` along with an array of `AXTabGroups`.
  * `AXWebContainerView` has a function called `swapWebView(_ webView: AXWebView)` which as in the name, switches the current web view being used.
  * `AXWindow` is an NSWindow subclass which holds all the views together. Except for the `AXProfiles`

## Additional Information
* You may have seen that there are no navigation buttons (back/forward/refresh) that is because it is a swipe based gesture now. Simply swipe on the left hand side of the toolbar. The direction is intuitive!
* Backwards : Swipe Left
* Forward : Swipe Right
* Reload : Swipe Down
* Cancel : Swipe up (If you accidentally swiped)
* New Tab : Command-T
 
## Photos

<img width="1512" alt="1" src="https://github.com/user-attachments/assets/bb33de57-7bef-475f-ae64-2bc9cd0d13d1" />

> Normal Width

<br />

<img width="1511" alt="2" src="https://github.com/user-attachments/assets/3240750d-7c74-4097-80f7-c134efb9c930" />

> Smaller Width + More Tabs

<br />

<img width="1512" alt="3" src="https://github.com/user-attachments/assets/549fbdc5-5628-4a2d-810c-64cee71ec971" />

> Scrollable Tab Bar  
> Tab is stickied to the right

<br />

<img width="1512" alt="4" src="https://github.com/user-attachments/assets/4bd9382f-bf1f-4b72-8cad-3a4727ea819f" />

> Tab is stickied to the left


## Video
https://github.com/user-attachments/assets/6b6034a1-7ea5-4a48-bd91-b83feb2d4b6d
