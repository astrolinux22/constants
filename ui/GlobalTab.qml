import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.ListItems 0.1
import QtQuick.XmlListModel 2.0
import QtWebKit 3.0
import Ubuntu.Components.Popups 0.1
import "../components"
//import "../mathjax/MathJax.js" as MathJax23

Tab {
    objectName: "title"
    title: categoryTitle

    XmlListModel{
        id: constantsFetcher
        source: "../data/" + categoryName + ".xml"

        query: "/category/constant"
        XmlRole { name: "constantSymbol"; query: "symbol/string()" }
        XmlRole { name: "constantValue"; query: "value/string()" }
        XmlRole { name: "constantExponent"; query: "exponent/string()" }
        XmlRole { name: "constantUnits"; query: "units/string()" }
        XmlRole { name: "constantDescription"; query: "description/string()" }
    }

    page: Page {

        tools: GlobalToolbar {
            objectName: globalToolbar
        }

        ListView {
            id:constantsList
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            //anchors.left: parent.left
            //anchors.right: parent.right
            width: parent.width
            clip: true

            model:constantsFetcher
            delegate: Standard {

                Component {
                        id: popoverDescription
                        Popover {
                            id: popover2

                            Label {
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.margins: units.gu(4)
                                text: "<br />" + constantDescription + "<br />"
                                color: UbuntuColors.coolGrey
                                horizontalAlignment: Text.AlignHCenter
                                wrapMode: Text.WordWrap
                                onLinkActivated: {
                                    Qt.openUrlExternally(link)
                                }
                            }
                        }
                    }


                id: constantsListItem
                //icon: Qt.resolvedUrl("avatar_contacts_list.png")
                //WebView {
                    //anchors.fill: parent
                    //height: 100
                    //width: 100
                    //scale: 1
                    //id: webView
                    //Component.onCompleted: loadHtml("<script type='text/javascript' src='../../mathjax/MathJax.js?config=TeX-AMS_HTML-SVG'></script><div style='background-color: rgba(0,0,0,0); font-size: 100px; width: 10px; height: 10px;'>$\mu_0$</div>")
                    //Component.onCompleted: loadHtml("<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><apply><in/><cn type=\"complex-cartesian\">17<sep/>29</cn><complexes/></apply></math>")
                //}
                //text: "μ[sub]0[/sub]"
                //text: webView

                //function convertBB(StringTemp) { StringTemp.replace("[","<"); StringTemp.replace("]",">"); return StringTemp }

                //property string constantSymbolConverted: {function() {constantSymbol.replace("[","<"); constantSymbol.replace("]",">"); return constantSymbol}}
                //Component.onCompleted: {function() {constantSymbol.replace("[","<"); constantSymbol.replace("]",">")}}
                property string constantSymbolConv: constantSymbol
                property string constantSymbolConv2: constantSymbolConv.replace(/\[/g,'<')
                property string constantSymbolConverted: constantSymbolConv2.replace(/\]/g,'>')

                property string constantExponentConv: constantExponent
                property string constantExponentConv2: constantExponentConv.replace(/\[/g,'<')
                property string constantExponentConverted: constantExponentConv2.replace(/\]/g,'>')

                property string constantUnitsConv: constantUnits
                property string constantUnitsConv2: constantUnitsConv.replace(/\[/g,'<')
                property string constantUnitsConverted: constantUnitsConv2.replace(/\]/g,'>')

                Text{
                    textFormat: TextEdit.RichText
                    //anchors.left: parent.left
                    //anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "<i>" + constantSymbolConverted + "</i> = <b>" + constantValue + constantExponentConverted + "</b> " + constantUnitsConverted
                }

                onClicked: PopupUtils.open(popoverDescription, constantsListItem)
                //subText: constantDescription
            }
        }
    }
}
