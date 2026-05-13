import QtQuick 2.3
import QtQuick.Controls 2.3
import SddmComponents 2.0

Rectangle {
    id: root
    width: Screen.width
    height: Screen.height

    Image {
        anchors.fill: parent
        source: config.background
        fillMode: Image.PreserveAspectCrop
    }

    Column {
        anchors.centerIn: parent
        spacing: 12

        Row {
            spacing: 10

            Text {
                font.family: "Hasklug Nerd Font"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: config.label_font_size
                text: "User"
                width: 80
            }

            TextField {
                id: userField
                width: 250
                height: 45
                placeholderText: "Type name..."

                background: Rectangle {
                    radius: 8
                    border.width: 2
                }

                font.family: "Hasklug Nerd Font"
            }
        }

        Row {
            spacing: 10

            Text {
                font.family: "Hasklug Nerd Font"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: config.label_font_size
                text: "Password"
                width: 80
            }

            TextField {
                id: passField
                width: 250
                height: 45
                placeholderText: "Type password..."
                echoMode: TextInput.Password

                background: Rectangle {
                    radius: 8
                    border.width: 2
                }

                font.family: "Hasklug Nerd Font"
            }

        }

        RoundButton {
            text: "Login"
            width: parent.width
            onClicked: sddm.login(userField.text, passField.text, sessionBox.index)
            font.family: "Hasklug Nerd Font"
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10

            RoundButton {
                icon.source: "./assets/Shutdown.svg"
                onClicked: sddm.powerOff()

                ToolTip.visible: hovered
                ToolTip.text: "Shutdown"
                ToolTip.delay: 500
                ToolTip.timeout: 3000
            }

            RoundButton {
                icon.source: "./assets/Reboot.svg"
                onClicked: sddm.reboot()

                ToolTip.visible: hovered
                ToolTip.text: "Reboot"
                ToolTip.delay: 500
                ToolTip.timeout: 3000
            }

            RoundButton {
                icon.source: "./assets/Hibernate.svg"
                onClicked: sddm.hibernate()

                ToolTip.visible: hovered
                ToolTip.text: "Hibernate"
                ToolTip.delay: 500
                ToolTip.timeout: 3000
            }

            RoundButton {
                icon.source: "./assets/Suspend.svg"
                onClicked: sddm.suspend()

                ToolTip.visible: hovered
                ToolTip.text: "Suspend"
                ToolTip.delay: 500
                ToolTip.timeout: 3000
            }
        }
    }

    ComboBox {
        id: sessionBox
        model: sessionModel
        index: sessionModel.lastIndex
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 20
    }
}
