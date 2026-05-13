import QtQuick 2.15
import QtQuick.Controls 2.15
import SddmComponents 2.0

Rectangle {
    id: root
    width: Screen.width
    height: Screen.height
    color: "#1e1e2e"

    Image {
        anchors.fill: parent
        source: config.background
        fillMode: Image.PreserveAspectCrop
    }

    Column {
        anchors.centerIn: parent
        spacing: 12

        TextField {
            id: userField
            width: 300
            placeholderText: "Пользователь"
        }

        TextField {
            id: passField
            width: 300
            placeholderText: "Пароль"
            echoMode: TextInput.Password
        }

        Button {
            text: "Войти"
            onClicked: sddm.login(userField.text, passField.text, sessionBox.index)
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
