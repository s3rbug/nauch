import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.3
import QtQuick.Dialogs 1.2

Item {
    id: menu
    signal menuItemClicked(string item, string page)
    property alias currentItem: listViewMenu.currentIndex

    ListModel {
        id: modelMenu
        ListElement {
            item: "algebra"
            icon: "qrc:/images/icon_game.png"
            page: "PageAlgebra.qml"
        }
        ListElement {
            item: "paintings"
            icon: "qrc:/images/icon_painter.png"
            page: "PagePaint.qml"
        }
        ListElement {
            item: "paintingsGenerator"
            icon: "qrc:/images/icon_painterGenerator.png"
            page: "PagePaintGenerator.qml"
        }
        ListElement {
            item: "XO"
            icon: "qrc:/images/icon_XO.png"
            page: "PageXO.qml"
        }
        ListElement {
            item: "about"
            icon: "qrc:/images/icon_info.png"
            page: "PageAbout.qml"
        }
        ListElement {
            item: "exit"
            icon: "qrc:/images/icon_exit.png"
            page: "PageExit.qml"
        }
    }

    function textItemMenu(item) {
        var textReturn = ""
        switch (item) {
        case "algebra":
            textReturn = qsTr("Вирази з числами")
            break
        case "XO":
            textReturn = qsTr("Хрестики-нулики")
            break
        case "about":
            textReturn = qsTr("Інфо")
            break
        case "paintings":
            textReturn = qsTr("Малювання")
            break
        case "paintingsGenerator":
            textReturn = qsTr("Створення малюнків")
            break
        case "exit":
            textReturn = qsTr("Вихід")
            break
        case "log":
            textReturn = "Log"
            break
        }
        return textReturn
    }

    Rectangle {
        id: logoWtapper
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        width: parent.width
        height: width * 0.5
        // color: palette.primary //"#3078fe"
        clip: true
        Image {
            id: imgLogo
            source: "qrc:/images/background.jpg"
            height: parent.height
            width: parent.width
            antialiasing: true
            smooth: true
            anchors.top: parent.top
            anchors.left: parent.left

            Image {
                id: img
                anchors.bottomMargin: 10
                source: "qrc:/images/icon_add.png"
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                width: parent.width / 5
                height: parent.height / 5
                fillMode: Image.PreserveAspectFit
                FileDialog {
                    id: fileDialog
                    title: "Please choose a file"
                    folder: shortcuts.home
                    nameFilters: ["Image files (*.jpg *.png *.jpeg)"]
                    onAccepted: {
                        imgLogo.source = fileDialog.fileUrl
                    }


                    /*onRejected: {
                        // TODO
                    }*/
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: fileDialog.visible = true
                }
            }
        }
    }
    Image {
        id: imgShadow
        anchors.top: logoWtapper.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 10 * app.dp
        z: 4
        source: "qrc:/images/shadow_title.png"
    }
    ListView {
        id: listViewMenu
        anchors.top: logoWtapper.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        clip: true
        model: modelMenu
        delegate: componentDelegate
    }

    Component {
        id: componentDelegate

        Rectangle {
            id: wrapperItem
            height: 70 * app.dp
            width: parent.width
            color: wrapperItem.ListView.isCurrentItem
                   || ma.pressed ? palette.currentHighlightItem : "transparent"
            Image {
                id: imgItem
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 0.5 * imgItem.width
                height: parent.height * 0.5
                width: height
                source: icon
                visible: icon != ""
                smooth: true
                antialiasing: true
            }

            Label {
                id: textItem
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: imgItem.right
                anchors.leftMargin: 0.7 * imgItem.width
                text: textItemMenu(item)
                font.pixelSize: parent.height * 0.4
            }

            MouseArea {
                id: ma
                hoverEnabled: true
                anchors.fill: parent
                enabled: app.menuIsShown
                onClicked: {
                    menu.menuItemClicked(item, page)
                    listViewMenu.currentIndex = index
                }
            }
        }
    }
}
