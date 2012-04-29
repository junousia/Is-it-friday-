import QtQuick 1.1
import com.nokia.meego 1.0
import "friday.js" as Friday
Page {
    id: root
    tools: commonTools

    Component.onCompleted: {
        theme.inverted = true;
        timer.start()
    }
    states: [
        State {
            name: "friday"
            PropertyChanges { target: label; opacity: 1.0 }
            PropertyChanges { target: label; text: qsTr("Yes, it is friday!") }
        },
        State {
            name: "not_friday"
            PropertyChanges { target: label; opacity: 1.0 }
            PropertyChanges { target: label; text: qsTr("No, it is not friday") }
        },
        State {
            name: "not_set"
            PropertyChanges { target: label; opacity: 0.0 }
            PropertyChanges { target: label; text: qsTr(" ") }
        }
    ]

    state: "not_set"

    Timer {
        id: timer
        interval: 2000
        repeat: false
        triggeredOnStart: false
        onTriggered:{
            if(Friday.isItFriday()) {
                root.state = "friday"
            } else {
                root.state = "not_friday"
            }
        }
    }
    Item {
        height: 200
        anchors.centerIn: parent
        Text {
            id: header
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 50
            color: "white"
            lineHeightMode: Text.FixedHeight
            lineHeight: font.pixelSize * 1.3
            text: qsTr("Is it friday?")
        }
        Text {
            id: label
            anchors.top: header.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 40
            color: "#aaa"
            lineHeightMode: Text.FixedHeight
            lineHeight: font.pixelSize * 1.3
            text: " "
            Behavior on opacity {
                NumberAnimation { duration : 750 }
            }
        }
    }
}

