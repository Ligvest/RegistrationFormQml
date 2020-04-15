import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.14

ApplicationWindow {
    property string name: "No info"
    property string country: "No info"
    property string email: "No info"
    width: 300
    height: 300
    id: root

    Column {
        anchors.centerIn: parent
        spacing: 10

        Text {
            color: "green"
            text: "Successfully registered:"
            font.pointSize: 14
        }

        Text {
            text: "Name: " + name + "\n" + "Country: " + country + "\n" + "Email: " + email
            font.pointSize: 12
        }

        Button {
            text: "Sign Up Again"
            onClicked: root.close()
        }
    }
}
