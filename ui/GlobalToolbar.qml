import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.ListItems 0.1
import Ubuntu.Components.Popups 0.1
//import "../mathjax/MathJax.js" as MathJax23

ToolbarItems {

    Component {
            id: popoverAbout
            Popover {
                id: popover
                //doneButton: true
                //title: "About ESV Bible"

                Label {
                    anchors.left:parent.left
                    anchors.right:parent.right
                    anchors.margins: units.gu(4)
                    text: "<br /><b>Constants</b><br /><br />This App is provided as is with no warrenty. I have done my best to ensure all values are correct but if you see an error please contact me and I will do my best to resolve it.<br /><br />Contact me at <a href='mailto:astrolinux22@gmail.com'>astrolinux22@gmail.com</a>.<br/><br />"
                    color: UbuntuColors.coolGrey
                    horizontalAlignment: Text.AlignJustify
                    wrapMode: Text.WordWrap
                    onLinkActivated: {
                        Qt.openUrlExternally(link)
                    }
                }
                Button {
                            text: "Close"
                            anchors.margins: units.gu(4)
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenter: parent.horizontalCenter
                            color: UbuntuColors.coolGrey
                            onClicked: PopupUtils.close(popover)

                }
            }
        }

    ToolbarButton {
        id: aboutButton
        iconSource: Qt.resolvedUrl("/usr/share/icons/ubuntu-mobile/actions/scalable/help.svg")
        text: i18n.tr("About")
        onTriggered: PopupUtils.open(popoverAbout, aboutButton)
    }
}
