import QtQuick 2.0

Item {
    width: 400
    height: 50
    Timer{
        id: timer_msg
        interval: 3000
        running: false
        repeat: false
        onTriggered: {
           rectangle.opacity = 0.0
        }
    }
    Rectangle {
        property bool stateVisible: true
        id: rectangle
        color: "#000000"
        radius: 15
        border.width: 0
        anchors.fill: parent
        opacity: 0.0
        Behavior on opacity {NumberAnimation{duration: 500}}
        Text {
            id: label
            color: "#ffffff"
            text: qsTr("This is a sample notification text")
            font.family: "Sans-serif"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
            font.pixelSize: 15
        }
    }
    function showMessage(msg){
        console.log("start")
        label.text =  msg
        rectangle.opacity = 1.0
        timer_msg.running = true
    }
}







/*##^## Designer {
    D{i:1;anchors_height:200;anchors_width:200;anchors_x:168;anchors_y:183}D{i:2;anchors_x:188;anchors_y:43}
}
 ##^##*/
