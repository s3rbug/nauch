import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.3
import algebra 1.0

MyPage {
    id: pageSettings
    property bool choiceMade: false
    property int level: 0
    property bool timedOut: false
    property bool gameStarted: false
    property int time: 63
    property int score: 0
    property bool played: false
    property int h: pageSettings.height - timerText.height
    property int currentVeg: 1
    property int countVeg: 5

    anchors.fill: parent
    title: "Вирази з числами"
    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min
    }
    Algebra {
        id: obj
    }
    Text {
        visible: !choiceMade
        id: txt
        text: "Вибери складність: "
        font.pixelSize: parent.height * 0.07
        height: 2 * parent.height / 8
    }
    Column {
        visible: !choiceMade
        anchors.top: txt.bottom
        height: 6 * parent.height / 8
        width: pageSettings.width
        RadioButton {
            text: "Легка"
            font.pixelSize: pageSettings.width / 30
            onPressed: {
                score = 0
                choiceMade = true
                level = 1
                obj.setLevel(level)
                obj.shuffle()
                currentVeg = getRandomInt(1, countVeg)
                problem1.text = obj.probl1() + " " + obj.sym() + " "
                problem2.text = obj.probl2()
                btn1.text = obj.sl1()
                btn2.text = obj.sl2()
            }
        }
        RadioButton {
            text: "Середня"
            font.pixelSize: pageSettings.width / 30
            onPressed: {
                score = 0
                choiceMade = true
                level = 2
                obj.setLevel(level)
                obj.shuffle()
                currentVeg = getRandomInt(1, countVeg)
                problem1.text = obj.probl1() + " " + obj.sym() + " "
                problem2.text = obj.probl2()
                btn1.text = obj.sl1()
                btn2.text = obj.sl2()
            }
        }
        RadioButton {
            text: "Складна"
            font.pixelSize: pageSettings.width / 30
            onPressed: {
                score = 0
                choiceMade = true
                level = 3
                obj.setLevel(level)
                obj.shuffle()
                currentVeg = getRandomInt(1, countVeg)
                problem1.text = obj.probl1() + " " + obj.sym() + " "
                problem2.text = obj.probl2()
                btn1.text = obj.sl1()
                btn2.text = obj.sl2()
            }
        }
    }
    Timer {
        id: timer
        interval: 1000
        repeat: true
        running: choiceMade

        onTriggered: {
            --time
            if (time == 0) {
                choiceMade = false
                gameStarted = false
                score = 0
                time = 63
            }
            if (time == 59) {
                gameStarted = true
            }
        }
    }
    Text {
        visible: choiceMade
        id: scr
        anchors.right: parent.right
        anchors.top: parent.top
        text: "Рахунок: " + score
        font.pixelSize: pageSettings.height * 0.05
    }
    Text {
        id: timerText
        MouseArea{
            id: tmp
            anchors.fill: parent
            hoverEnabled: true
        }
        ToolTip.text: qsTr("При закінченні часу, гра завершиться")
        ToolTip.visible: tmp.containsMouse
        ToolTip.delay: 1500
        ToolTip.timeout: 5000
        visible: choiceMade
        text: time >= 60 ? time - 60 : "0:" + (time < 10 ? "0" : "") + time
        color: time <= 10 ? "red" : "black"
        width: pageSettings.width
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: pageSettings.height * 0.05
    }
    Column {
        id: col
        anchors.top: timerText.bottom
        anchors.bottom: pageSettings.bottom
        anchors.left: pageSettings.left
        anchors.right: pageSettings.right
        visible: gameStarted && choiceMade
        spacing: 50
        Row {
            height: 0.6 * h
            Rectangle {
                y: 0.6 * h - height
                width: pageSettings.width / 2 - (img1.width + img2.width
                                                 + problem1.width + problem2.width) / 2
                height: 1
                // color: "blue"
            }
            Image {
                id: img1
                fillMode: Image.PreserveAspectFit
                source: "qrc:/images/icon_veg" + currentVeg + ".png"
                y: 0.6 * h - height
                height: problem1.height
                horizontalAlignment: Image.AlignRight
            }
            Text {
                id: problem1
                //width:
                y: 0.6 * h - height
                font.pixelSize: pageSettings.height * 0.15
                //horizontalAlignment: Text.AlignHCenter
            }
            Image {
                id: img2
                fillMode: Image.PreserveAspectFit
                source: "qrc:/images/icon_veg" + currentVeg + ".png"
                y: 0.6 * h - height
                height: problem1.height
                horizontalAlignment: Image.AlignRight
            }
            Text {
                id: problem2
                //width:
                y: 0.6 * h - height
                font.pixelSize: pageSettings.height * 0.15
                //horizontalAlignment: Text.AlignHCenter
            }
        }

        Row {
            height: 0.4 * h - 50
            width: pageSettings.width
            leftPadding: 60
            rightPadding: 60
            spacing: 60
            Button {
                id: btn1
                ToolTip.text: qsTr("Вибери правильну кількість рослин")
                ToolTip.visible: hovered
                ToolTip.delay: 1500
                ToolTip.timeout: 5000
                height: 0.25 * h
                hoverEnabled: true
                background: Rectangle{
                    anchors.fill: parent
                    color: parent.pressed ? "#A9AAAA" : (parent.hovered ?  "#C4C5C5" : "#D6D7D7")
                }
                onClicked: {
                    if (obj.fCor())
                        ++score
                    else if (score != 0)
                        --score
                    obj.shuffle()
                    currentVeg = getRandomInt(1, countVeg)
                    //problem.text = obj.prob()
                    problem1.text = obj.probl1() + " " + obj.sym() + " "
                    problem2.text = obj.probl2()

                    btn1.text = obj.sl1()
                    btn2.text = obj.sl2()
                }
                width: pageSettings.width / 2 - 90
                font.pixelSize: parent.height * 0.4
            }
            Button {
                id: btn2
                height: 0.25 * h
                ToolTip.text: qsTr("Вибери правильну кількість рослин")
                ToolTip.visible: hovered
                ToolTip.delay: 1500
                ToolTip.timeout: 5000
                hoverEnabled: true
                background: Rectangle{
                    anchors.fill: parent
                    color: parent.pressed ? "#A9AAAA" : (parent.hovered ?  "#C4C5C5" : "#D6D7D7")
                }
                onClicked: {
                    if (!obj.fCor())
                        ++score
                    else if (score != 0)
                        --score
                    obj.shuffle()
                    currentVeg = getRandomInt(1, countVeg)
                    problem1.text = obj.probl1() + " " + obj.sym() + " "
                    problem2.text = obj.probl2()
                    btn1.text = obj.sl1()
                    btn2.text = obj.sl2()
                }
                width: pageSettings.width / 2 - 90
                font.pixelSize: parent.height * 0.4
            }
        }
    }
}
