import QtQuick 2.3
import QtQuick.Controls 2.3

ToolTip {
    id: root

    property color textColor:       "white"
    property color glassColor:      Qt.rgba(1, 1, 1, 0.15)
    property color borderColor:     Qt.rgba(1, 1, 1, 0.40)
    property real  glassRadius:     8

    padding: 8
    delay: 500
    timeout: 3000

    contentItem: Text {
        text: root.text
        font: root.font
        color: root.textColor
        wrapMode: Text.WordWrap
    }

    background: Rectangle {
        radius: root.glassRadius
        color: root.glassColor
        border.color: root.borderColor
        border.width: 1
    }

    enter: Transition {
        NumberAnimation {
            property: "opacity"
            from: 0.0
            to: 1.0
            duration: 200
            easing.type: Easing.OutQuad
        }
    }

    exit: Transition {
        NumberAnimation {
            property: "opacity"
            from: 1.0
            to: 0.0
            duration: 150
            easing.type: Easing.InQuad
        }
    }
}
