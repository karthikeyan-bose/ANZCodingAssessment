//
//  README.md
//  ANZCodingAssessment

# ANZ Coding Assessment

A small iOS project created as part of the ANZ coding assessment.

---

## Overview

This app includes two screens built using **SwiftUI**, **async/await**, and **Dependency Injection**.

- **User List Screen** – Fetches user data from
  `https://fake-json-api.mock.beeceptor.com/users`
- **User Detail Screen** – Displays selected user information with profile photo.

The focus is on architecture and code quality rather than UI design.

---

## Key Points

- MVVM structure
- Async/Await for networking
- SwiftUI for UI
- Dependency Injection for testability
- Unit tests using a Mock service
- Handles loading and error states

> Note: SwiftUI’s `@StateObject` and `@Published` handle updates automatically. I used async/await for simple and clean networking.


---

## Technologies Used

- Swift Version: 6.1.2
- Xcode Version: 16.1
- Deployment Target: iOS 17.0
- SwiftUI
- Async/Await
- XCTest (unit testing)

---

## Possible Improvements

- Add local caching or offline support
- Custom thumbnail image with loading indicator
- Pagination for large lists
- UI test coverage

---

## How to Run

1. Clone the repo
2. Open `ANZCodingAssessment.xcodeproj` in Xcode (v16.1 or later)
3. Build & Run on any iPhone simulator (iOS 17+)

---

## Author

**Karthikeyan Bose**
Senior iOS Engineer – Swift | SwiftUI | MVVM Architecture
