//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Darya Viter on 28.06.2022.
//

import SwiftUI
import CodeScanner
import UserNotifications

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }

    enum SortingTipe {
        case byName, byRecent
    }

    @EnvironmentObject var prospects: Prospects
    @State private var isShowingScaner = false
    @State private var isShowingSort = false
    @State private var sortingType = SortingTipe.byName

    let filter: FilterType

    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
        }
    }

    var filteredProspects: [Prospect] {
        switch filter {
        case .none:
            return prospects.people
        case .contacted:
            return prospects.people.filter { $0.isContacted }
        case .uncontacted:
            return prospects.people.filter { !$0.isContacted }
        }
    }

    var filteredAndSortedProspects: [Prospect] {
        switch sortingType {
        case .byName:
            return filteredProspects.sorted()
        case .byRecent:
            return filteredProspects.sorted { $0.addDate > $1.addDate }
        }
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(filteredAndSortedProspects) { prospect in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(prospect.name)
                                .font(.headline)
                            Text(prospect.emailAddress)
                                .foregroundColor(.secondary)
                        }

                        Spacer()

                        if filter == .none && !prospect.isContacted {
                            Image(systemName: "person.fill.questionmark")
                        }
                    }
                    .swipeActions {
                        if prospect.isContacted {
                            Button {
                                prospects.toggle(prospect)
                            } label: {
                                Label("Mark Uncontacted", systemImage: "person.crop.circle.badge.xmark")
                            }
                            .tint(.blue)
                        } else {
                            Button {
                                prospects.toggle(prospect)
                            } label: {
                                Label("Mark Contacted", systemImage: "person.crop.circle.fill.badge.checkmark")
                            }
                            .tint(.green)

                            Button {
                                addNotification(for: prospect)
                            } label: {
                                Label("Remind Me", systemImage: "bell")
                            }
                            .tint(.orange)
                        }
                    }
                    .confirmationDialog("Sorting Rule", isPresented: $isShowingSort) {
                        Button {
                            sortingType = .byName
                        } label: {
                            Label("Sort By Name", systemImage: "arrow.up.and.person.rectangle.portrait")
                        }
                        Button {
                            sortingType = .byRecent
                        } label: {
                            Label("Sort By Recent", systemImage: "person.badge.clock.fill")
                        }
                    }
                }
            }
            .navigationTitle(title)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        isShowingScaner = true
                    } label: {
                        Label("Scan", systemImage: "qrcode.viewfinder")
                    }

                    Button {
                        isShowingSort = true
                    } label: {
                        Label("Sort", systemImage: "arrow.up.arrow.down.circle.fill")
                    }
                }

            }
            .sheet(isPresented: $isShowingScaner) {
                CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson\npaul@hackingwithswift.com", completion: handleScan)
            }

        }
    }

    private func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScaner = false
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else { return }
            let prospect = Prospect()
            prospect.name = details[0]
            prospect.emailAddress = details[1]
            prospect.addDate = Date()
            prospects.add(prospect)
        case .failure(let error):
            print(error.localizedDescription)
        }
    }

    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()

        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.emailAddress
            content.sound = UNNotificationSound.default

            var dateComponents = DateComponents()
            dateComponents.hour = 9
//            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }

        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        print("D' oh!")
                    }
                }
            }
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
            .environmentObject(Prospects())
    }
}
