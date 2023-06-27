import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Column {

        spacing: 20

        TextField {
            cursorVisible: true

            validator: bulatDoubleValidator

            onTextChanged: console.log( text )
        }

        Row {
            spacing: 10
            Label { text: 'decimals:' }
            TextField {
                text: '1'
                validator: IntValidator{}
                onAccepted:  {
                    console.log( "new decimals == ", text )
                    bulatDoubleValidator.decimals = text
                }
            }
        }
    }


    RegularExpressionValidator {
        id: bulatDoubleValidator

        property int decimals: 1

        regularExpression: decimals === 0 ?
                               new RegExp( "\\d{1,3}?$" )
                             : new RegExp( "(\\d{1,3})([.,]\\d{1," + decimals + "})?$" );


    }
}
