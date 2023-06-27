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
            id: textField
            cursorVisible: true

            property real max: 10000
            property real min: 0

            validator: bulatDoubleValidator

            text: '0'

            onEditingFinished: {

                if(  text < min )
                    text = min

                if( text > max )
                    text = max

                const number = parseFloat( text.replace( ',','.' ) )

                text = isNaN(number) ? min : number
            }
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

        Row {
            spacing: 10
            Label { text: 'min:' }
            TextField {
                validator: bulatDoubleValidator
                onAccepted:  {
                    console.log( "min == ", text )
                    setMin( text )
                }
            }
        }

        Row {
            spacing: 10
            Label { text: 'max:' }
            TextField {
                validator: bulatDoubleValidator
                onAccepted:  {
                    console.log( "max == ", text )
                    setMax( text )
                }
            }
        }
    }


    RegularExpressionValidator {
        id: bulatDoubleValidator

        property int decimals: 1

        regularExpression: decimals === 0 ? /-?\d{1,3}?$/
                                          : new RegExp( "-?(\\d{0,3})([.,]\\d{1," + decimals + "})?$" );
    }

    function setMax( realMax ) {
        textField.max = realMax
    }

    function setMin( realMin ) {
        textField.min = realMin
    }
}
