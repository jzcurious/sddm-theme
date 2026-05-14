import QtQuick 2.3
import QtQuick.Controls 2.3
import Qt5Compat.GraphicalEffects

TextField {
    id: root

    width:350
    height: 45
    horizontalAlignment: TextInput.AlignHCenter

    property color textColor: "white"
    property color glassColor: Qt.rgba(1, 1, 1, 0.15)
    property color borderColor: Qt.rgba(1, 1, 1, 0.3)
    property color focusBorderColor: Qt.rgba(1, 1, 1, 0.6)
    property real glassRadius: 12

    property url leftIcon: ""
    property url rightIcon: ""
    property color iconColor: "white"

    color: textColor
    placeholderTextColor: Qt.rgba(1, 1, 1, 0.5)

    leftPadding: leftIcon != "" ? 45 : 12
    rightPadding: rightIcon != "" ? 45 : 12

    background: Rectangle {
        radius: root.glassRadius
        color: root.glassColor
        border.color: root.borderColor
        border.width: 1

        Image {
            id: leftIconImage
            anchors.left: parent.left
            anchors.leftMargin: 12
            anchors.verticalCenter: parent.verticalCenter
            source: root.leftIcon
            width: 20
            height: 20
            fillMode: Image.PreserveAspectFit
            visible: false
        }

        ColorOverlay {
            anchors.fill: leftIconImage
            source: leftIconImage
            color: root.iconColor
            opacity: 0.7
            visible: root.leftIcon != ""
        }

        MouseArea {
            anchors.right: parent.right
            anchors.rightMargin: 8
            anchors.verticalCenter: parent.verticalCenter
            width: 30
            height: 30
            visible: root.text.length > 0 || root.rightIcon != ""
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true

            onClicked: {
                if (root.text.length > 0) {
                    root.clear()
                }
            }

            Image {
                id: rightIconImage
                anchors.centerIn: parent
                source: root.rightIcon
                width: 16
                height: 16
                fillMode: Image.PreserveAspectFit
                visible: false
            }

            ColorOverlay {
                anchors.fill: rightIconImage
                source: rightIconImage
                color: root.iconColor
                opacity: parent.containsMouse ? 1.0 : 0.6

                Behavior on opacity { NumberAnimation { duration: 150 } }
            }
        }

        Rectangle {
            anchors.fill: parent
            radius: parent.radius
            color: "transparent"
            border.color: root.focusBorderColor
            border.width: 1
            visible: root.activeFocus

            Behavior on opacity { NumberAnimation { duration: 150 } }
        }
    }
}
