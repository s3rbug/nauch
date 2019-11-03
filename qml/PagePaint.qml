import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Dialogs 1.2
import Testing 1.0
import field 1.0

MyPage {
    id: rt
    property int count: 30
    property int w: (width - 100) / count
    property int h: (height - 100) / count
    property int rw: w * count
    property int rh: h * count
    property variant colors: ["white", "red", "green", "blue", "brown", "pink", "yellow", "black"]
    property int chosen: 0
    property int outlineWidth: 5
    property int size: Math.min(100, (height - 100) / countColors)
    property int countColors: colors.length
    property bool seen: true
    property bool firstTime: true
    property int it: 0
    property int times: 1
    property int fontSize: 0
    property bool correct: false
    onWidthChanged: firstTime = true
    onHeightChanged: firstTime = true
    title: "Малювання"
    Field {
        id: f
    }
    ListView {
        id: view
        visible: seen
        z: visible ? 10 : 0
        anchors.fill: parent
        model: Model
        delegate: Item {
            id: item
            anchors.left: parent.left
            anchors.right: parent.right
            height: 40
            Button {
                background: Rectangle{
                    anchors.fill: parent
                    color: parent.pressed ? "#A9AAAA" : (parent.hovered ?  "#C4C5C5" : "#D6D7D7")
                }
                anchors.fill: parent
                anchors.margins: 5
                Text{
                    anchors.fill: parent
                    text: name
                    font.pixelSize: 1000
                    minimumPixelSize: 5
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                onClicked: {
                    preset.idx(index)
                    it = index
                    seen = false
                    firstTime = true
                    canva.requestPaint()
                }
            }
        }
        header: Text {
            text: preset.empty(
                      ) ? "Створи малюнок у вкладці <b>Створення малюнків</b>" : "Вибери малюнок:"
            font.pixelSize: 0.04 * rt.height
        }
    }

    MouseArea {
        id: ma
        anchors.fill: parent
        hoverEnabled: true
        onPositionChanged: {
            if (pressed && mouseX > 0 && mouseX <= rw && mouseY > 0
                    && mouseY <= rh) {
                var i = Math.floor(mouseX / w), j = Math.floor(mouseY / h)
                f.set(i, j, chosen)
                canva.markDirty(Qt.rect(i * w, j * h, w, h))
            }
        }
        onPressed: {
            if (pressed && mouseX > 0 && mouseX <= rw && mouseY > 0
                    && mouseY <= rh) {
                var i = Math.floor(mouseX / w), j = Math.floor(mouseY / h)
                f.set(i, j, chosen)
                canva.markDirty(Qt.rect(i * w, j * h, w, h))
            }
        }
    }
    Row {
        visible: !seen
        z: visible ? 10 : 0
        Canvas {
            id: canva
            width: rt.width - 100
            height: rt.height - 100
            onPaint: {
                var ctx = getContext("2d")
                ctx.clearRect(region)
                ctx.font = Math.max(w / 3, 10) + "px Arial"
                var i = region.x / w, j = region.y / h
                ctx.fillStyle = colors[f.get(i, j)]
                ctx.fillRect(i * w, j * h, w, h)
                ctx.fillStyle = f.get(i, j) === 7 ? "white" : "black"
                ctx.textAlign = "center"
                ctx.fillText(cur.get(i, j), i * w + w / 2, j * h + h - h / 2)
                if (firstTime) {
                    ctx.clearRect(0, 0, rt.width, rt.height)
                    for (var a = 0; a < count; ++a)
                        for (var b = 0; b < count; ++b)
                            ctx.fillText(cur.get(a, b), a * w + w / 2,
                                         b * h + h - h / 2)
                    firstTime = false
                }

                ctx.beginPath()
                ctx.lineWidth = 2
                ctx.lineCap = "round"
                ctx.strokeStyle = "black"
                ctx.strokeRect(-1, -1, rw, rh)
            }
        }

        Column {
            width: 100
            height: rt.height - 100
            spacing: (((rt.height - 100) - (size * countColors))) / countColors
            Rectangle {
                id: r0
                property int idx: 0
                MouseArea {
                    anchors.fill: parent
                    onClicked: chosen = r0.idx
                }
                Text {
                    anchors.fill: parent
                    text: r0.idx
                    font.pixelSize: 100
                    minimumPixelSize: 5
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                border.color: "black"
                border.width: chosen == idx ? outlineWidth : 1
                height: size
                width: size
                color: colors[idx]
            }
            Rectangle {
                id: r1
                property int idx: 1
                MouseArea {
                    anchors.fill: parent
                    onClicked: chosen = r1.idx
                }
                Text {
                    anchors.fill: parent
                    text: r1.idx
                    font.pixelSize: 100
                    minimumPixelSize: 5
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                border.color: "black"
                border.width: chosen == idx ? outlineWidth : 0
                height: size
                width: size
                color: colors[idx]
            }
            Rectangle {
                id: r2
                property int idx: 2
                MouseArea {
                    anchors.fill: parent
                    onClicked: chosen = r2.idx
                }
                Text {
                    anchors.fill: parent
                    text: r2.idx
                    font.pixelSize: 100
                    minimumPixelSize: 5
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                border.color: "black"
                border.width: chosen == idx ? outlineWidth : 0
                height: size
                width: size
                color: colors[idx]
            }
            Rectangle {
                id: r3
                property int idx: 3
                MouseArea {
                    anchors.fill: parent
                    onClicked: chosen = r3.idx
                }
                Text {
                    anchors.fill: parent
                    text: r3.idx
                    font.pixelSize: 100
                    minimumPixelSize: 5
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                border.color: "black"
                border.width: chosen == idx ? outlineWidth : 0
                height: size
                width: size
                color: colors[idx]
            }
            Rectangle {
                id: r4
                property int idx: 4
                MouseArea {
                    anchors.fill: parent
                    onClicked: chosen = r4.idx
                }
                Text {
                    anchors.fill: parent
                    text: r4.idx
                    font.pixelSize: 100
                    minimumPixelSize: 5
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                border.color: "black"
                border.width: chosen == idx ? outlineWidth : 0
                height: size
                width: size
                color: colors[idx]
            }
            Rectangle {
                id: r5
                property int idx: 5
                MouseArea {
                    anchors.fill: parent
                    onClicked: chosen = r5.idx
                }
                Text {
                    anchors.fill: parent
                    text: r5.idx
                    font.pixelSize: 100
                    minimumPixelSize: 5
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                border.color: "black"
                border.width: chosen == idx ? outlineWidth : 0
                height: size
                width: size
                color: colors[idx]
            }
            Rectangle {
                id: r6
                property int idx: 6
                MouseArea {
                    anchors.fill: parent
                    onClicked: chosen = r6.idx
                }
                Text {
                    anchors.fill: parent
                    text: r6.idx
                    font.pixelSize: 100
                    minimumPixelSize: 5
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                border.color: "black"
                border.width: chosen == idx ? outlineWidth : 0
                height: size
                width: size
                color: colors[idx]
            }
            Rectangle {
                id: r7
                property int idx: 7
                MouseArea {
                    anchors.fill: parent
                    onClicked: chosen = r7.idx
                }
                Text {
                    anchors.fill: parent
                    text: r7.idx
                    font.pixelSize: 100
                    minimumPixelSize: 5
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: "white"
                }
                border.color: "white"
                border.width: chosen == idx ? outlineWidth : 0
                height: size
                width: size
                color: colors[idx]
            }
        }
    }
    Dialog {
        id: confirm
        visible: false
        standardButtons: Dialog.Ok
        Text {
            id: dtxt
            anchors.fill: parent
            font.pixelSize: 40
            minimumPixelSize: 5
            fontSizeMode: Text.Fit
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        onAccepted: {
            if (correct) {
                seen = !seen
                correct = false
            }
        }
    }
    function check(ind) {
        for (var i = 0; i < 30; ++i) {
            for (var j = 0; j < 30; ++j) {
                if (f.get(i, j) !== cur.get(i, j))
                    return false
            }
        }
        return true
    }
    Row {
        visible: !seen
        height: 100
        width: rt.width
        anchors.bottom: rt.bottom
        Button {
            height: rt.height - rh - 50
            width: rw / 3
            background: Rectangle{
                anchors.fill: parent
                color: parent.pressed ? "#A9AAAA" : (parent.hovered ?  "#C4C5C5" : "#D6D7D7")
            }
            Text {
                anchors.fill: parent
                text: "Готово"
                font.pixelSize: 100
                minimumPixelSize: 5
                fontSizeMode: Text.Fit
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            onClicked: {
                if (check(it)) {
                    dtxt.text = "Ти переміг! Кількість спроб - " + times
                    confirm.visible = true
                    times = 1
                    correct = true
                } else {
                    dtxt.text = "Перевір клітинки ще раз"
                    confirm.visible = true
                    ++times
                    correct = false
                }
            }
        }
        spacing: rw / 3
        Button {
            height: rt.height - rh - 50
            width: rw / 3
            background: Rectangle{
                anchors.fill: parent
                color: parent.pressed ? "#A9AAAA" : (parent.hovered ?  "#C4C5C5" : "#D6D7D7")
            }
            Text {
                anchors.fill: parent
                text: "Стерти"
                font.pixelSize: 100
                minimumPixelSize: 5
                fontSizeMode: Text.Fit
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            onClicked: {
                f.clr()
                firstTime = true
                canva.requestPaint()
            }
        }
    }
}
