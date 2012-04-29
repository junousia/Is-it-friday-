import QtQuick 1.1
import com.nokia.meego 1.0

PageStackWindow {
    id: appWindow

    initialPage: mainPage

    MainPage {
        id: mainPage
    }

    ToolBarLayout {
        id: commonTools
        visible: true
        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (myMenu.status === DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }
    }

    Menu {
        id: myMenu
        visualParent: pageStack
        MenuLayout {
            MenuItem { text: qsTr("About"); onClicked: about.open()  }
        }
    }

    QueryDialog {
        id: about
        titleText: "Is it friday? v1.0"
        message: "(c) Jukka Nousiainen 2012\n\n" + qsTr("This application is free sofware licenced under the GNU Public License version 3")
        rejectButtonText: qsTr("Close")
    }
}
