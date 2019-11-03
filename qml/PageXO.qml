import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import xofield 1.0

MyPage {
    id: pageXO
    title: qsTr("Хрестики-нулики")
    property bool first: true
    property int sz: cl.height / 3
    property int count: 0
    XOField {
        id: f
    }
    Row {
        id: rw
        visible: false
        anchors.fill: pageXO
        Text {
            width: 4 * rw.width / 5
            height: rw.height / 8
            id: after
            font.pixelSize: 100
            minimumPixelSize: 5
            fontSizeMode: Text.Fit
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Button {
            id: rest
            width: rw.width / 5
            height: rw.height / 8
            background: Rectangle{
                anchors.fill: parent
                color: parent.pressed ? "#A9AAAA" : (parent.hovered ?  "#C4C5C5" : "#D6D7D7")
            }
            Text {
                text: "Розпочати заново"
                anchors.fill: parent
                font.pixelSize: 100
                minimumPixelSize: 5
                fontSizeMode: Text.Fit
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            onClicked: {
                start()
            }
        }
    }
    function restart() {
        if (count == 9 && !f.check())
            after.text = "Ви зіграли в нічию!"
        else if (first)
            after.text = "Перший гравець переміг!"
        else
            after.text = "Другий гравець переміг!"
        look.visible = false
        rw.visible = true
        count = 0
        first = true
    }
    function start() {
        t1.text = t2.text = t3.text = t4.text = t5.text = t6.text = t7.text = t8.text = t9.text = ""
        f.clear()
        rw.visible = false
        look.visible = true
        first = true
    }
    Column {
        id: look
        Text {
            id: turn
            text: first ? "Хід першого гравця" : "Хід другого гравця"
            height: pageXO.height / 10
            width: pageXO.width
            font.pixelSize: 100
            minimumPixelSize: 5
            fontSizeMode: Text.Fit
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Column {
            id: cl
            width: pageXO.width
            height: 9 * pageXO.height / 10
            Row {
                Button {
                    background: Rectangle {
                        color: parent.hovered ? "#D0D0D0" : "white"
                    }
                    width: pageXO.width / 3
                    height: sz
                    onClicked: {
                        if (t1.text == "") {
                            f.set(0, 0, first + 1)
                            if (++count == 9 || f.check()) {
                                restart()
                            }
                            if (first) {
                                t1.text = "X"
                                t1.color = "red"
                            } else {
                                t1.text = "O"
                                t1.color = "blue"
                            }
                            first = !first
                        }
                    }
                    Text {
                        id: t1
                        anchors.fill: parent
                        font.pixelSize: 10000
                        minimumPixelSize: 5
                        fontSizeMode: Text.Fit
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
                Button {
                    background: Rectangle {
                        color: parent.hovered ? "#D0D0D0" : "white"
                    }
                    width: pageXO.width / 3
                    height: sz
                    onClicked: {
                        if (t2.text == "") {
                            f.set(0, 1, first + 1)
                            if (++count == 9 || f.check()) {
                                restart()
                            }
                            if (first) {
                                t2.text = "X"
                                t2.color = "red"
                            } else {
                                t2.text = "O"
                                t2.color = "blue"
                            }
                            first = !first
                        }
                    }
                    Text {
                        id: t2
                        anchors.fill: parent
                        font.pixelSize: 10000
                        minimumPixelSize: 5
                        fontSizeMode: Text.Fit
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
                Button {
                    background: Rectangle {
                        color: parent.hovered ? "#D0D0D0" : "white"
                    }
                    width: pageXO.width / 3
                    height: sz
                    onClicked: {
                        if (t3.text == "") {
                            f.set(0, 2, first + 1)
                            if (++count == 9 || f.check()) {
                                restart()
                            }
                            if (first) {
                                t3.text = "X"
                                t3.color = "red"
                            } else {
                                t3.text = "O"
                                t3.color = "blue"
                            }
                            first = !first
                        }
                    }
                    Text {
                        id: t3
                        anchors.fill: parent
                        font.pixelSize: 10000
                        minimumPixelSize: 5
                        fontSizeMode: Text.Fit
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
            Row {
                Button {
                    background: Rectangle {
                        color: parent.hovered ? "#D0D0D0" : "white"
                    }
                    width: pageXO.width / 3
                    height: sz
                    onClicked: {
                        if (t4.text == "") {
                            f.set(1, 0, first + 1)
                            if (++count == 9 || f.check()) {
                                restart()
                            }
                            if (first) {
                                t4.text = "X"
                                t4.color = "red"
                            } else {
                                t4.text = "O"
                                t4.color = "blue"
                            }
                            first = !first
                        }
                    }
                    Text {
                        id: t4
                        anchors.fill: parent
                        font.pixelSize: 10000
                        minimumPixelSize: 5
                        fontSizeMode: Text.Fit
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
                Button {
                    background: Rectangle {
                        color: parent.hovered ? "#D0D0D0" : "white"
                    }
                    width: pageXO.width / 3
                    height: sz
                    onClicked: {
                        if (t5.text == "") {
                            f.set(1, 1, first + 1)
                            if (++count == 9 || f.check()) {
                                restart()
                            }
                            if (first) {
                                t5.text = "X"
                                t5.color = "red"
                            } else {
                                t5.text = "O"
                                t5.color = "blue"
                            }
                            first = !first
                        }
                    }
                    Text {
                        id: t5
                        anchors.fill: parent
                        font.pixelSize: 10000
                        minimumPixelSize: 5
                        fontSizeMode: Text.Fit
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
                Button {
                    background: Rectangle {
                        color: parent.hovered ? "#D0D0D0" : "white"
                    }
                    width: pageXO.width / 3
                    height: sz
                    onClicked: {
                        if (t6.text == "") {
                            f.set(1, 2, first + 1)
                            if (++count == 9 || f.check()) {
                                restart()
                            }
                            if (first) {
                                t6.text = "X"
                                t6.color = "red"
                            } else {
                                t6.text = "O"
                                t6.color = "blue"
                            }
                            first = !first
                        }
                    }
                    Text {
                        id: t6
                        anchors.fill: parent
                        font.pixelSize: 10000
                        minimumPixelSize: 5
                        fontSizeMode: Text.Fit
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
            Row {
                Button {
                    background: Rectangle {
                        color: parent.hovered ? "#D0D0D0" : "white"
                    }
                    width: pageXO.width / 3
                    height: sz
                    onClicked: {
                        if (t7.text == "") {
                            f.set(2, 0, first + 1)
                            if (++count == 9 || f.check()) {
                                restart()
                            }
                            if (first) {
                                t7.text = "X"
                                t7.color = "red"
                            } else {
                                t7.text = "O"
                                t7.color = "blue"
                            }
                            first = !first
                        }
                    }
                    Text {
                        id: t7
                        anchors.fill: parent
                        font.pixelSize: 10000
                        minimumPixelSize: 5
                        fontSizeMode: Text.Fit
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
                Button {
                    background: Rectangle {
                        color: parent.hovered ? "#D0D0D0" : "white"
                    }
                    width: pageXO.width / 3
                    height: sz
                    onClicked: {
                        if (t8.text == "") {
                            f.set(2, 1, first + 1)
                            if (++count == 9 || f.check()) {
                                restart()
                            }
                            if (first) {
                                t8.text = "X"
                                t8.color = "red"
                            } else {
                                t8.text = "O"
                                t8.color = "blue"
                            }
                            first = !first
                        }
                    }
                    Text {
                        id: t8
                        anchors.fill: parent
                        font.pixelSize: 10000
                        minimumPixelSize: 5
                        fontSizeMode: Text.Fit
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
                Button {
                    background: Rectangle {
                        color: parent.hovered ? "#D0D0D0" : "white"
                    }
                    width: pageXO.width / 3
                    height: sz
                    onClicked: {
                        if (t9.text == "") {
                            f.set(2, 2, first + 1)
                            if (++count == 9 || f.check()) {
                                restart()
                            }
                            if (first) {
                                t9.text = "X"
                                t9.color = "red"
                            } else {
                                t9.text = "O"
                                t9.color = "blue"
                            }
                            first = !first
                        }
                    }
                    Text {
                        id: t9
                        anchors.fill: parent
                        font.pixelSize: 10000
                        minimumPixelSize: 5
                        fontSizeMode: Text.Fit
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
        }
    }
}
