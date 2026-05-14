import QtQuick 2.3
import QtQuick.Controls 2.3
import SddmComponents 2.0

Control {
    id: root
    width: Screen.width
    height: Screen.height
    font.family: config.font_family

    Image {
        anchors.fill: parent
        source: config.background
        fillMode: Image.PreserveAspectCrop
    }

    Rectangle {
        anchors.centerIn: parent
        width: Screen.width / 4
        height: Screen.height * 0.45
        radius: 20
        color: Qt.rgba(0, 0, 0, 0.85)
        border.color: Qt.rgba(0, 0, 0, 1.0)
        border.width: 1

        Column {
            anchors.centerIn: parent
            spacing: 40

            Row{
                Column {
                    spacing: 12

                    GlassField {
                        id: userField
                        placeholderText: "Username"
                        text: userModel.lastUser
                        onAccepted: passField.forceActiveFocus()
                    }

                    GlassField {
                        id: passField
                        placeholderText: "Password"
                        echoMode: TextInput.Password
                        focus: true

                        onAccepted: {
                            if (passField.text !== "") {
                                sddm.login(userField.text, passField.text, sessionBox.index)
                            }
                        }
                    }

                    GlassButton {
                        text: "Log in"
                        width: parent.width
                        onClicked: sddm.login(userField.text, passField.text, sessionBox.index)
                    }
                }
            }

            Row {
                Column {
                    spacing: 12

                    Row {
                        anchors.horizontalCenter: parent.horizontalCenter
                        spacing: 22

                        GlassButton {
                            width: 45
                            height: 45
                            glassRadius: 50
                            iconSource: "../assets/Shutdown.svg"
                            onClicked: sddm.powerOff()

                            GlassToolTip {
                                visible: parent.hovered
                                text: "Shutdown"
                            }
                        }

                        GlassButton {
                            width: 45
                            height: 45
                            glassRadius: 50
                            iconSource: "../assets/Reboot.svg"
                            onClicked: sddm.reboot()

                            GlassToolTip {
                                visible: parent.hovered
                                text: "Reboot"
                            }
                        }

                        GlassButton {
                            width: 45
                            height: 45
                            glassRadius: 50
                            iconSource: "../assets/Hibernate.svg"
                            onClicked: sddm.hibernate()

                            GlassToolTip {
                                visible: parent.hovered
                                text: "Hibernate"
                            }
                        }

                        GlassButton {
                            width: 45
                            height: 45
                            glassRadius: 50
                            iconSource: "../assets/Suspend.svg"
                            onClicked: sddm.suspend()

                            GlassToolTip {
                                visible: parent.hovered
                                text: "Suspend"
                            }
                        }
                    }

                    GlassComboBox {
                        id: sessionBox
                        model: sessionModel
                        currentIndex: sessionModel.lastIndex
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }
        }
    }
}
