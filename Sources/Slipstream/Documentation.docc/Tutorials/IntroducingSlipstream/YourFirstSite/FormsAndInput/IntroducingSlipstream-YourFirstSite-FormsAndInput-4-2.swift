import Foundation

import Slipstream

struct Contact: View {
  var body: some View {
    HTML {
      Head {
        Stylesheet(URL(string: "main.css"))
      }
      Body {
        Container {
          H1("Contact Coco")
            .fontSize(.extraExtraExtraLarge)
            .bold()
            .margin(.bottom, 32)

          Text("Want to say hello to Coco? Fill out the form below!")
            .margin(.bottom, 24)

          Form(method: .post, url: URL(string: "/submit")) {
            VStack(alignment: .leading, spacing: 24) {
              Fieldset {
                Legend("Contact Information")

                VStack(alignment: .leading, spacing: 16) {
                  TextField("Your name", type: .text, name: "name")
                    .padding(12)
                    .border(.all, width: 1, color: .gray, darkness: 300)
                    .cornerRadius(.medium)
                    .border(.all, width: 2, color: .blue, darkness: 500, condition: .focus)
                    .frame(width: .full)

                  TextField("Your email", type: .email, name: "email")
                    .padding(12)
                    .border(.all, width: 1, color: .gray, darkness: 300)
                    .cornerRadius(.medium)
                    .border(.all, width: 2, color: .blue, darkness: 500, condition: .focus)
                    .frame(width: .full)

                  TextArea("Your message", name: "message", rows: 5)
                    .padding(12)
                    .border(.all, width: 1, color: .gray, darkness: 300)
                    .cornerRadius(.medium)
                    .border(.all, width: 2, color: .blue, darkness: 500, condition: .focus)
                    .frame(width: .full)
                }
              }

              Fieldset {
                Legend("Preferences")

                VStack(alignment: .leading, spacing: 16) {
                  VStack(alignment: .leading, spacing: 8) {
                    Label {
                      Text("How did you find Coco?")
                        .bold()
                    }
                    Picker(name: "source") {
                      Option("Please select", value: "")
                      Option("Social media", value: "social")
                      Option("Search engine", value: "search")
                      Option("Friend referral", value: "referral")
                      Option("Travel website", value: "travel")
                    }
                    .padding(12)
                    .border(.all, width: 1, color: .gray, darkness: 300)
                    .cornerRadius(.medium)
                    .frame(width: .full)
                  }

                  VStack(alignment: .leading, spacing: 8) {
                    Label {
                      Text("What's your favorite Coco activity?")
                        .bold()
                    }
                    VStack(alignment: .leading, spacing: 4) {
                      HStack(alignment: .center, spacing: 8) {
                        RadioButton(value: "swimming", name: "activity")
                        Label {
                          Text("Swimming")
                        }
                      }
                      HStack(alignment: .center, spacing: 8) {
                        RadioButton(value: "beach", name: "activity")
                        Label {
                          Text("Beach lounging")
                        }
                      }
                      HStack(alignment: .center, spacing: 8) {
                        RadioButton(value: "greeting", name: "activity")
                        Label {
                          Text("Greeting tourists")
                        }
                      }
                    }
                  }

                  HStack(alignment: .center, spacing: 8) {
                    Checkbox(name: "newsletter")
                    Label {
                      Text("Subscribe to Coco's newsletter")
                    }
                  }
                }
              }

              Button(.submit) {
                Text("Send Message")
              }
              .padding(.horizontal, 24)
              .padding(.vertical, 12)
              .background(.blue, darkness: 600)
              .textColor(.white)
              .cornerRadius(.medium)
              .background(.blue, darkness: 700, condition: .hover)
              .fontWeight(600)
            }
          }
        }
        .padding(.vertical, 48)
      }
    }
  }
}

let sitemap: Sitemap = [
  "contact.html": Contact()
]

guard let projectURL = URL(filePath: #filePath)?
  .deletingLastPathComponent()
  .deletingLastPathComponent() else {
  print("Unable to create URL for \(#filePath)")
  exit(1)
}

let outputURL = projectURL.appending(path: "site")

try renderSitemap(sitemap, to: outputURL)
