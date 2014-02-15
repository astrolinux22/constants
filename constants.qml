import QtQuick 2.0
import Ubuntu.Components 0.1
import QtQuick.XmlListModel 2.0
import Ubuntu.Components.ListItems 0.1
import "ui"

/*!
    \brief MainView with Tabs element.
           First Tab has a single Label and
           second Tab has a single ToolbarAction.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "com.ubuntu.developer..constants"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    automaticOrientation: true

    width: units.gu(50)
    height: units.gu(75)

    XmlListModel{
        id: tabsFetcher
        source: "data/tabs.xml"
        query: "/tabs/tab"

        XmlRole { name: "categoryTitle"; query: "@title/string()" }
    }
    Tabs {
        id:tabs
        Repeater {
            model:tabsFetcher
            Tab {
                objectName: "title"
                title: categoryTitle

                page: Page {
                    Column {
                        spacing: units.gu(2)
                        anchors.centerIn: parent

                    Label {
                        objectName: "helloTab_label"

                        anchors.horizontalCenter: parent.horizontalCenter
                        text: i18n.tr("You can change the Tab from Page title above.")
                        }
                    }
                }
            }
        }
    }
}
