import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.ListItems 0.1
import QtQuick.XmlListModel 2.0
import "../components"

Tab {
    objectName: "title"
    title: categoryTitle

    XmlListModel{
        id: constantsFetcher
        property url constantsFile: "data/" + categoryTitle + "Constants.xml"
        source: "data/PhysicalConstants.xml"

        query: "/category/constant"
        XmlRole { name: "constantSymbol"; query: "string()" }
    }

    page: Page {
            ListView {
                id:constantsList
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                clip: true

                Subtitled {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "data/" + categoryTitle + "Constants.xml"
                    subText: "Test Subtext"
                }

                model:constantsFetcher
                delegate: Standard {
                    icon: Qt.resolvedUrl("avatar_contacts_list.png")
                    text: constantSymbol //+ "=" + constantValue + " E " + constantExponent + " " + constantUnits
                    //subText: "Here is subtext" //constantDescription
                }
            }
        }
    }

