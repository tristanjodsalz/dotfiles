import QtQuick
import QtQuick.Shapes
import Quickshell
import Quickshell.Wayland

Item {

    id: root

    // Enum to define which corner this instance represents
    enum Corner { TopLeft, TopRight, BottomRight, BottomLeft }
    required property int corner

    required property int radius
    required property color color

    // Optional horizontal offset (useful to place the corner next to a panel)
    property int offset: 0

    readonly property bool isTop: corner === RoundCorner.Corner.TopLeft || corner === RoundCorner.Corner.TopRight
    readonly property bool isLeft: corner === RoundCorner.Corner.TopLeft || corner === RoundCorner.Corner.BottomLeft

    PanelWindow {
        WlrLayershell.layer: WlrLayershell.Layer.Overlay
        WlrLayershell.namespace: "screen-corner"
        exclusionMode: ExclusionMode.Ignore

        WlrLayershell.margins.left: root.isLeft ? root.offset : 0
        WlrLayershell.margins.right: !root.isLeft ? root.offset : 0

        anchors {
            top: root.isTop ? true : undefined
            bottom: !root.isTop ? true : undefined
            left: root.isLeft ? true : undefined
            right: !root.isLeft ? true : undefined
        }

        implicitWidth: root.radius
        implicitHeight: root.radius
        color: "transparent"

        Shape {
            anchors.fill: parent
            preferredRendererType: Shape.CurveRenderer

            ShapePath {
                strokeWidth: 0
                fillColor: root.color

                startX: 0
                startY: 0

                PathAngleArc {
                    moveToStart: false
                    centerX: root.radius
                    centerY: root.radius
                    radiusX: root.radius
                    radiusY: root.radius
                    startAngle: 180
                    sweepAngle: 90
                }

                PathLine { x: 0; y: 0 }
            }

            transform: Rotation {
                origin.x: root.radius / 2
                origin.y: root.radius / 2
                angle: root.corner * 90
            }
        }
    }
}