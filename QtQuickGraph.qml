import QtQuick 2.3

Rectangle {
    id: windowsss
    width: 800
    height: 500

    property int yScale: 25
    property int xScale: 10

    ListModel {
        id: points
        ListElement {
            x: 10
            y: 410
        }
        ListElement {
            x: 610
            y: 10
        }
    }

    Canvas {
        id: myCanvas
        anchors.fill: parent

        function drawGrid(ctx) {
            var bw = 600;
            var bh = 400;
            var p = 10;
            var cw = bw + (p*2) + 1;
            var ch = bh + (p*2) + 1;

//            var ctx = getContext("2d");

            for (var x = 0; x <= bw; x += 40) {
                ctx.moveTo(x + p, p);
                ctx.lineTo(x + p, bh + p);
            }


            for (var x = 0; x <= bh; x += 40) {
                ctx.moveTo(p, x + p);
                ctx.lineTo(bw + p, x + p);
            }

            ctx.strokeStyle = "#ccc";
            ctx.stroke();
        }

        onPaint: {
            var ctx = getContext('2d')
            ctx.reset()
            drawGrid(ctx)

            console.log("########")
            for (var i = 0; i < points.count; i++)
                console.log(points.get(i).x)



            ctx.beginPath();
            if(points.count > 1) {
                ctx.moveTo(points.get(0).x, points.get(0).y)
                for (var i = 1; i < points.count; i++)
                    ctx.lineTo(points.get(i).x, points.get(i).y)

            }

            ctx.strokeStyle = "#333";
            ctx.stroke();
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                var i = 0
                var x = mouseX
                var y = mouseY
                while (points.get(i).x < x) {
                    i++;
                }

                points.append({x:x, y:y})
                points.move(points.count-1, i, 1)
                myCanvas.requestPaint()
            }

        }

    }

}

