import QtQuick 2.14
import QtQuick.Window 2.12
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import com.company.comboboxupdate 1.0

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 450
    height: 600
    property variant signUpActionWin
    ComboboxUpdate {
        id: comboboxUpdater
    }
    Rectangle {
        id: mainRect
        width: 450
        height: 600
        anchors.fill: parent

        color: theme.checked ? toGray.start() : toWhite.start()

        ColorAnimation on color {
            id: toWhite
            to: "white"
            duration: 500
        }

        ColorAnimation on color {
            id: toGray
            to: "dark gray"
            duration: 500
        }

        Column {
            id: header
            anchors.left: parent.left
            anchors.right: parent.right
            padding: 20

            Switch {
                id: theme
                anchors.right: parent.right
                visible: true
            }

            Column {
                spacing: 20

                Text {
                    text: "Sign Up"
                    font.pointSize: 24
                }

                Text {
                    text: "Please fill in this form to create an account!"
                    font.pointSize: 12
                    color: "gray"
                }
            }
        }

        Rectangle {
            anchors.top: header.bottom
            id: separator
            height: 1

            width: mainRect.width //mainWindow
            color: "lightgray"
        }

        Column {
            id: body

            visible: true
            anchors {
                top: separator.bottom
            }

            padding: 20
            spacing: 20
            GridLayout {

                id: username
                flow: mainRect.width
                      > 400 ? GridLayout.LeftToRight : GridLayout.TopToBottom //mainWindow

                TextField {
                    id: firstName
                    width: 150
                    placeholderText: "First Name"
                    validator: RegularExpressionValidator {
                        regularExpression: /[A-Za-z]+/
                    }
                }

                TextField {
                    id: lastName
                    width: 150
                    placeholderText: "Last Name"
                }
            }

            ComboBox {
                id: country
                currentIndex: -1
                displayText: currentIndex == -1 ? "Select your country" : currentText
                width: username.width
                model: comboboxUpdater.comboList
            }

            TextField {
                id: email
                width: username.width
                placeholderText: "Email"
                validator: RegularExpressionValidator {
                    regularExpression: /[A-Za-z0-9.]+@[A-Za-z]+\.[A-Za-z0-9]+/
                }
            }
            TextField {
                id: password
                passwordCharacter: '*'
                echoMode: TextInput.Password
                width: username.width
                placeholderText: "Password"
                validator: RegularExpressionValidator {
                    regularExpression: /.+/
                }
            }

            Row {
                id: terms
                spacing: 10

                CheckBox {
                    id: termsCheckbox
                }

                Text {
                    font.pointSize: 12
                    text: "I accept the Terms of Use"
                    color: "gray"
                }
            }

            Button {
                text: "Sign Up"

                enabled: firstName.acceptableInput && email.acceptableInput
                         && password.acceptableInput && termsCheckbox.checked
                         && (country.currentIndex > -1)

                onClicked: {
                    var component = Qt.createComponent("signupaction.qml")
                    var signUpActionWin = component.createObject(mainWindow, {
                                                                     "name": firstName.text + " " + lastName.text,
                                                                     "country": country.currentText,
                                                                     "email": email.text
                                                                 })

                    // clear all fields after user registered
                    signUpActionWin.show()
                    firstName.text = ""
                    lastName.text = ""
                    email.text = ""
                    password.text = ""
                    country.currentIndex = -1
                    termsCheckbox.checked = false
                }
            }
        }
    }
}
