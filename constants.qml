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

                XmlListModel{
                    id: constantsFetcher
                    source: "data/" + categoryTitle + "Constants.xml"

                    query: "/category/constant"
                    XmlRole { name: "constantSymbol"; query: "symbol/string()" }
                    XmlRole { name: "constantValue"; query: "value/string()" }
                    XmlRole { name: "constantExponent"; query: "exponent/string()" }
                    XmlRole { name: "constantUnits"; query: "units/string()" }
                    XmlRole { name: "constantDescription"; query: "description/string()" }
                }

                page: Page {

                        tools: ToolbarItems {
                            ToolbarButton {
                                iconSource: Qt.resolvedUrl("graphics/toolbarIcon.png")
                                text: i18n.tr("About")
                            }
                        }
                        ListView {
                            id:constantsList
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            anchors.right: parent.right
                            clip: true

                            model:constantsFetcher
                            delegate: Subtitled {
                                //icon: Qt.resolvedUrl("avatar_contacts_list.png")
                                text: constantSymbol + "\t" + constantValue + "E" + constantExponent + "\t " + constantUnits
                                subText: constantDescription
                            }
                        }

                }

            }
        }
    }
}
