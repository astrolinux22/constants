import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.ListItems 0.1
import QtQuick.XmlListModel 2.0
import "../components"

Tab {
    title: i18n.tr("Global Tab")

    page: Page {
        tools: GlobalTabTools {
            objectName: "GlobalTab_tools"
        }
    TabListComponent {
        objectName: "GlobalTab_list"

    }

    }
}
