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
                anchors.verticalCenter: parent.verticalCenter
                text: "User"
                font.pixelSize: 14
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
            }
        }

        Row {
            spacing: 10

            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: "Password"
                font.pixelSize: 14
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
            }
        }

        RoundButton {
            text: "Login"
            width: parent.width
            onClicked: sddm.login(userField.text, passField.text, sessionBox.index)
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10

            RoundButton {
                text: "Shutdown"
                onClicked: sddm.powerOff()
            }

            RoundButton {
                text: "Reboot"
                onClicked: sddm.reboot()
            }

            RoundButton {
                text: "Hibernate"
                onClicked: sddm.hibernate()
            }

            RoundButton {
                text: "Suspend"
                onClicked: sddm.suspend()
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
