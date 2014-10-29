import QtQuick 2.3

Rectangle {
    width: 360
    height: 360

    ListModel {
        id: points
//        ListElement {
//            x: 100
//            y: 22
//        }
//        ListElement {
//            x: 150
//            y: 22
//        }
    }

    Canvas {
        id: myCanvas
        anchors.fill: parent

        onPaint: {
            console.log(points.get(0).x)
            var ctx = getContext('2d')
            ctx.beginPath();
            if(points.count > 1) {
                ctx.moveTo(points.get(0).x, points.get(0).y);
                for (var i=1; i < points.count; i++)
                    ctx.lineTo(points.get(i).x, points.get(i).y);
            }
            ctx.stroke();
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                points.append({x: mouseX, y:mouseY})
                myCanvas.requestPaint()
            }

        }

    }

}

