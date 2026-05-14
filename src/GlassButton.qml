import QtQuick 2.3
import QtQuick.Controls 2.3
import QtQuick.Effects
import Qt5Compat.GraphicalEffects

Button {
    id: root

    width: 350
    height: 45

    property color textColor:        "white"
    property color glassColor:       Qt.rgba(1, 1, 1, 0.10)
    property color glassColorHover:  Qt.rgba(1, 1, 1, 0.20)
    property color glassColorPress:  Qt.rgba(1, 1, 1, 0.30)
    property color borderColor:      Qt.rgba(1, 1, 1, 0.40)
    property real  glassRadius:      12

    property color iconColor:        "white"
    property url   iconSource:       ""
    property int   iconSize:         24

    contentItem: Item {
        Text {
            anchors.centerIn: parent
            text: root.text
            font: root.font
            color: root.textColor
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            visible: root.iconSource == ""
        }

        Image {
            id: iconImage
            anchors.centerIn: parent
            source: root.iconSource
            width: root.iconSize
            height: root.iconSize
            fillMode: Image.PreserveAspectFit
            visible: false
        }

        ColorOverlay {
            anchors.fill: iconImage
            source: iconImage
            color: root.iconColor
            visible: root.iconSource != ""
        }
    }

    background: Rectangle {
        radius: root.glassRadius
        color: root.pressed
               ? root.glassColorPress
               : root.hovered
                 ? root.glassColorHover
                 : root.glassColor

        border.color: root.borderColor
        border.width: 1

        Behavior on color { ColorAnimation { duration: 150 } }
    }
}
