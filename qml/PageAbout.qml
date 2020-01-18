import QtQuick 2.12
import QtQuick.Controls 1.3
import QtQuick.Controls.Material 2.3

MyPage {
    id: pageSettings

    title: qsTr("Інфо")
    property string linkGithub: "https://github.com/s3rbug/nauch"
    Text {
        text: "Version: 1.0 (user setup)<br>
Date: 2019-05-01<br>
Qt: " + qtversion + "<br>
<a href='https://github.com/s3rbug/nauch'>Source code</a>"
        onLinkActivated: Qt.openUrlExternally(linkGithub)
        anchors.fill: parent
        font.pixelSize: 60
        minimumPixelSize: 5
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
    }
}
