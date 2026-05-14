import QtQuick 2.3
import QtQuick.Controls 2.3
import Qt5Compat.GraphicalEffects

ComboBox {
    id: root

    width: 350
    height: 45

    property color textColor:        "white"
    property color glassColor:       Qt.rgba(1, 1, 1, 0.10)
    property color glassColorHover:  Qt.rgba(1, 1, 1, 0.20)
    property color glassColorPress:  Qt.rgba(1, 1, 1, 0.30)
    property color borderColor:      Qt.rgba(1, 1, 1, 0.40)
    property real  glassRadius:      12
    property int   indicatorSize:    16
    property color indicatorColor:   "white"

    textRole: "name"

    background: Rectangle {
        radius: root.glassRadius
        color: root.pressed || root.popup.visible
               ? root.glassColorPress
               : root.hovered
                 ? root.glassColorHover
                 : root.glassColor
        border.color: root.borderColor
        border.width: 1
        Behavior on color { ColorAnimation { duration: 150 } }
    }

    contentItem: Text {
        anchors.left: parent.left
        anchors.right: root.indicator ? root.indicator.left : parent.right
        anchors.verticalCenter: parent.verticalCenter
        leftPadding: 15
        rightPadding: 15
        text: root.displayText
        font: root.font
        color: root.textColor
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    indicator: Canvas {
        width: root.indicatorSize
        height: root.indicatorSize
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 10
        rotation: root.popup.visible ? 180 : 0
        Behavior on rotation { NumberAnimation { duration: 150 } }
        onPaint: {
            var ctx = getContext("2d")
            ctx.reset()
            ctx.strokeStyle = root.indicatorColor
            ctx.lineWidth = 2
            ctx.lineCap = "round"
            ctx.lineJoin = "round"
            ctx.beginPath()
            ctx.moveTo(width * 0.2, height * 0.35)
            ctx.lineTo(width * 0.5, height * 0.65)
            ctx.lineTo(width * 0.8, height * 0.35)
            ctx.stroke()
        }
    }

    popup: Popup {
        y: root.height - 1
        width: root.width
        height: root.height
        implicitHeight: Math.min(contentItem.contentHeight, 300)
        padding: 4
        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: root.delegateModel
        }
        background: Rectangle {
            radius: root.glassRadius
            color: root.glassColorPress
            border.color: root.borderColor
            border.width: 1
        }
    }

    delegate: ItemDelegate {
        width: ListView.view.width - 2 * padding
        contentItem: Text {
            leftPadding: 15
            rightPadding: 15
            text: model.name || model.text || modelData
            font: root.font
            color: root.textColor
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        background: Rectangle {
            radius: root.glassRadius
            color: down ? root.glassColorPress
                      : hovered ? root.glassColorHover
                      : "transparent"
            Behavior on color { ColorAnimation { duration: 150 } }
        }
        highlighted: root.highlightedIndex === index
    }
}
