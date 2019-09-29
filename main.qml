import QtQuick 2.13
import QtQuick.Window 2.13
import QtLocation 5.13
import QtQuick.Controls 2.5
import QtPositioning 5.13
import QtQuick.Extras 1.4



Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("MapMe!")
    Connections{
        target: Locator
        onPositionUpdatedView : {
            marker.visible =true
            marker.anchorPoint.x = image_marker.width/4
            marker.anchorPoint.y = image_marker.height
            marker.coordinate =  info

        }
        onAddressUpdatedView:{
            message.showMessage(address)
            map.center = marker.coordinate
            nav_icon_locate_me.visible = true
            busyIndicator.visible = false
        }
    }
    Plugin {
        id: mapPlugin
        name: "here"
        PluginParameter{name: "here.app_id"; value: "YcFcRULoKXQ7uFyyUFXi"}
        PluginParameter{name: "here.token"; value: "RrY07ZqUc93icAWoP0FDIg"}

    }
    Map {
        id: map
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        plugin: mapPlugin
        zoomLevel: 10
        Behavior on zoomLevel { SmoothedAnimation { velocity: 500 } }
        Behavior on center {
            CoordinateAnimation {
                duration: 500
                easing.type: Easing.InOutQuad
            }
        }
        center: QtPositioning.coordinate(23.11, -82.36)
        MapQuickItem {
            id: marker
            visible:  false
            sourceItem: Image {
                id: image_marker
                width: 50
                height: 50
                source: "icon.png"
                fillMode: Image.PreserveAspectFit
            }

        }
        Rectangle {
            id: top_bar
            height: 50
            color: "#000000"
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            Text {
                id: nav_icon
                width: 50
                color: "#ffffff"
                text:"\uF35C"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.top: parent.top
                font.family: "Material Design Icons"
                font.pixelSize: 30
                opacity: 1
                MouseArea{
                    id: menu_trigger
                    anchors.fill: parent
                    onClicked: {
                        if(menu.x == 0 ){
                            menu.x = -250
                            nav_icon.text = "\uF35C"
                        }else{
                            menu.x = 0
                             nav_icon.text = "\uF156"
                        }
                    }
                }
            }
            Text {
                id: label_title
                font.family: "sans-serif"
                color: "#ffffff"
                text: qsTr("MapMe!")
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.top: parent.top
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 20
            }
        }

        Rectangle {
            id: menu
            x: -250
            z: 75
            width: 250
            color: "#000000"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: top_bar.bottom
            anchors.topMargin: 0
            Behavior on x { SmoothedAnimation { velocity: 400 } }

            Text {
                id: menu_option_1
                height: 50
                color: "#ffffff"
                text: qsTr("Location History")
                textFormat: Text.PlainText
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 20
                font.pixelSize: 20
            }

            Text {
                id: menu_option_2
                x: -9
                y: -8
                height: 50
                color: "#ffffff"
                text: qsTr("Settings")
                anchors.right: parent.right
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                anchors.top: menu_option_1.bottom
                anchors.leftMargin: 0
                anchors.topMargin: 0
                anchors.rightMargin: 0
                verticalAlignment: Text.AlignVCenter
                anchors.left: parent.left
            }

        }

        Rectangle {
            id: floating_button
            x: 582
            y: 422
            z:100
            width: 50
            height: 50
            color: "#000000"
            radius: 25
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            border.width: 0

            Text {
                id: nav_icon_locate_me
                width: 50
                color: "#ffffff"
                text: "\uF34E"
                font.pixelSize: 30
                horizontalAlignment: Text.AlignHCenter
                MouseArea {
                    id: mouse_area_locate_me
                    anchors.fill: parent
                    onClicked: {
                        nav_icon_locate_me.visible = false
                        Locator.startLocation()
                        busyIndicator.visible = true
                    }
                }
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                opacity: 1
                verticalAlignment: Text.AlignVCenter
                font.family: "Material Design Icons"
                anchors.left: parent.left
            }

            BusyIndicator {
                id: busyIndicator
                font.pointSize: 10
                anchors.fill: parent
                visible: false

            }
        }

        Message {
            id: message
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: top_bar.bottom
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
        }




    }

}































/*##^## Designer {
    D{i:3;anchors_width:200;anchors_x:174;anchors_y:52}D{i:4;anchors_x:324;anchors_y:18}
D{i:7;anchors_height:200;anchors_x:42;anchors_y:110}D{i:6;anchors_height:200;anchors_x:42;anchors_y:110}
D{i:10;anchors_x:324;anchors_y:18}D{i:9;anchors_x:79;anchors_y:31}D{i:11;anchors_height:200;anchors_x:324;anchors_y:18}
D{i:8;anchors_x:79;anchors_y:31}D{i:12;anchors_height:200;anchors_x:42;anchors_y:110}
D{i:18;anchors_x:22;anchors_y:18}D{i:19;anchors_x:230;anchors_y:56}D{i:5;anchors_height:200;anchors_x:42;anchors_y:110}
}
 ##^##*/
