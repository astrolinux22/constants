import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.ListItems 0.1
import QtQuick.XmlListModel 2.0

Page {
    width: parent.width
    height: units.gu(50)
    ListView {
        id:"test"
        Standard {
            width: parent.width
            height: units.gu(4)
            text: "Test"
            progression: true
        }
    }
}
