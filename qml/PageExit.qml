import QtQuick 2.12
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Material 2.3

MyPage {
    id: pageSettings
    property string url: "https://en.wikipedia.org/wiki/Elephant#/media/File:African_Bush_Elephant.jpg"
    property int countMade: 0
    title: "Вихід"
    Dialog {
        visible: countMade > 10
        title: "Увага"
        Text {
            anchors.fill: parent
            onLinkActivated: Qt.openUrlExternally(url)
            text: "Як виглядає <a href='https://en.wikipedia.org/wiki/Elephant#/media/File:African_Bush_Elephant.jpg'>слон</a>"
        }
        standardButtons: StandardButton.Ok
    }
    Column {
        anchors.fill: parent
        Text {
            id: text
            width: pageSettings.width
            font.pixelSize: parent.width / 30
            text: "Натисни на <b>слоника</b>, щоб вийти"
            horizontalAlignment: Text.AlignHCenter
        }
        Row {
            Image {
                source: "qrc:/images/icon_tig.png"
                fillMode: Image.PreserveAspectFit
                width: pageSettings.width / 2
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        ++countMade
                    }
                }
            }
            Image {
                source: "qrc:/images/icon_elephant2.png"
                fillMode: Image.PreserveAspectFit
                width: pageSettings.width / 2
                MouseArea {
                    anchors.fill: parent
                    onClicked: Qt.quit()
                }
            }
        }
    }
}
