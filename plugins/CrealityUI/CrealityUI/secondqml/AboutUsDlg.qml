import QtQuick 2.13
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.13

import CrealityUI 1.0

import "qrc:/CrealityUI"

DockItem {
  id: root

  width: 800 * screenScaleFactor
  height: 420 * screenScaleFactor

  title: qsTr("About Us")

  readonly property string context: cxkernel_const.translateContext

  readonly property string logo: "qrc:/scence3d/res/logo.png"
  readonly property bool logoVisible: true

  readonly property string name: cxkernel_const.bundleName
  readonly property bool nameVisible: true

  readonly property string version: "%1 %2 %3".arg(name)
                                              .arg(cxkernel_const.version)
                                              .arg(cxkernel_const.versionExtra)
  readonly property bool versionVisible: true

  readonly property string copyright: qsTranslate(context, "sofrware_copyright")
  readonly property bool copyrightVisible: copyright !== "sofrware_copyright"

  readonly property string introduction: qsTranslate(context, "offical_introduction")
  readonly property bool introductionVisible: introduction !== "offical_introduction"

  readonly property string websiteTitle: qsTranslate(context, "aboutusdialog_webside")
  readonly property string website: qsTranslate(context, "offical_webside")
  readonly property bool websiteVisible: website !== "offical_webside"

  readonly property string emailTitle: qsTranslate(context, "aboutusdialog_email")
  readonly property string email: qsTranslate(context, "offical_email")
  readonly property bool emailVisible: email !== "offical_email"

  readonly property string telephoneTitle: qsTranslate(context, "aboutusdialog_telephone")
  readonly property string telephone: qsTranslate(context, "offical_telephone")
  readonly property bool telephoneVisible: telephone !== "offical_telephone"

  CopyRightDlg {
    id: copyright_dialog
  }

  ColumnLayout {
    id: root_layout

    anchors.fill: parent
    anchors.margins: 20 * screenScaleFactor
    anchors.topMargin: 20 * screenScaleFactor + root.currentTitleHeight

    spacing: 10 * screenScaleFactor

    RowLayout {
      id: logo_name_layout

      Layout.fillWidth: true
      Layout.bottomMargin: parent.spacing

      visible: root.logoVisible || root.nameVisible

      Image {
        id: logo_image

        width: 28 * screenScaleFactor
        height: 28 * screenScaleFactor

        visible: root.logoVisible

        source: root.logo
        sourceSize.width: width
        sourceSize.height: height
        fillMode: Image.PreserveAspectFit
      }

      Text {
        id: name_text

        Layout.fillWidth: true

        visible: root.nameVisible

        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter

        text: root.name
        textFormat: Text.PlainText
        wrapMode: Text.WordWrap
        font.family: Constants.labelFontFamily
        font.weight: Constants.labelFontWeight
        font.pointSize:  Constants.labelFontPointSize_12
        color: Constants.textColor
      }
    }

    TextEdit {
      id: introduction_edit

      Layout.fillWidth: true
      height: contentHeight
      Layout.bottomMargin: parent.spacing

      visible: root.introductionVisible

      padding: 0

      text: root.introduction
      textFormat: TextEdit.PlainText
      wrapMode: TextEdit.WordWrap
      font.family: Constants.labelFontFamily
      font.weight: Constants.labelFontWeight
      font.pointSize: Constants.labelFontPointSize_9
      color: Constants.textColor

      readOnly: true
      selectByMouse: true
      selectByKeyboard: false
    }

    Text {
      id: version_text

      Layout.fillWidth: true

      visible: root.versionVisible

      horizontalAlignment: Text.AlignLeft
      verticalAlignment: Text.AlignTop

      text: root.version
      textFormat: Text.PlainText
      wrapMode: Text.WordWrap
      font.family: Constants.labelFontFamily
      font.weight: Constants.labelFontWeight
      font.pointSize: Constants.labelFontPointSize_9
      color: Constants.textColor
    }

    Text {
      id: copyright_text

      Layout.fillWidth: true

      visible: root.copyrightVisible

      horizontalAlignment: Text.AlignLeft
      verticalAlignment: Text.AlignTop

      text: root.copyright
      textFormat: Text.PlainText
      wrapMode: Text.WordWrap
      font.family: Constants.labelFontFamily
      font.weight: Constants.labelFontWeight
      font.pointSize: Constants.labelFontPointSize_9
      color: Constants.textColor
    }

    Text {
      id: website_text

      Layout.fillWidth: true

      visible: root.websiteVisible

      horizontalAlignment: Text.AlignLeft
      verticalAlignment: Text.AlignTop

      text: "%1: <a href='%2' style='color:%3'>%2</a>"
              .arg(root.websiteTitle)
              .arg(root.website)
              .arg("#449ec7")
      textFormat: Text.RichText
      wrapMode: Text.WordWrap
      font.family: Constants.labelFontFamily
      font.weight: Constants.labelFontWeight
      font.pointSize: Constants.labelFontPointSize_9
      color: Constants.textColor

      onLinkActivated: function(link) {
        Qt.openUrlExternally(link)
      }
    }

    Text {
      id: email_text

      Layout.fillWidth: true

      visible: root.emailVisible

      horizontalAlignment: Text.AlignLeft
      verticalAlignment: Text.AlignTop

      text: "%1: <a href='mailto:%2' style='color:%3'>%2</a>"
              .arg(root.emailTitle)
              .arg(root.email)
              .arg("#449ec7")
      textFormat: Text.RichText
      wrapMode: Text.WordWrap
      font.family: Constants.labelFontFamily
      font.weight: Constants.labelFontWeight
      font.pointSize: Constants.labelFontPointSize_9
      color: Constants.textColor

      onLinkActivated: function(link) {
        Qt.openUrlExternally(link)
      }
    }

    Text {
      id: telephone_text

      Layout.fillWidth: true
      Layout.fillHeight: true

      visible: root.telephoneVisible

      horizontalAlignment: Text.AlignLeft
      verticalAlignment: Text.AlignTop

      text: "%1: %2"
              .arg(root.telephoneTitle)
              .arg(root.telephone)
      textFormat: Text.RichText
      wrapMode: Text.WordWrap
      font.family: Constants.labelFontFamily
      font.weight: Constants.labelFontWeight
      font.pointSize: Constants.labelFontPointSize_9
      color: Constants.textColor
    }

    Item {
      Layout.fillWidth: true
      Layout.fillHeight: true
    }

    RowLayout {
      id: button_layout

      Layout.fillWidth: true
      Layout.minimumHeight: 28 * screenScaleFactor
      Layout.maximumHeight: Layout.minimumHeight
      Layout.alignment: Qt.AlignCenter

      spacing: 10 * screenScaleFactor

      BasicDialogButton {
        id: copyright_button

        Layout.minimumWidth: 125 * screenScaleFactor
        Layout.fillHeight: true
        Layout.alignment: Qt.AlignCenter

        text: qsTr("Portions Copyright")

        btnRadius: height / 2
        btnBorderW: 0
        defaultBtnBgColor: Constants.profileBtnColor
        hoveredBtnBgColor: Constants.profileBtnHoverColor

        onSigButtonClicked: {
          copyright_dialog.show()
        }
      }

      BasicDialogButton {
        id: close_button

        Layout.minimumWidth: 125 * screenScaleFactor
        Layout.fillHeight: true
        Layout.alignment: Qt.AlignCenter

        text: qsTr("Close")

        btnRadius: height / 2
        btnBorderW: 0
        defaultBtnBgColor: Constants.profileBtnColor
        hoveredBtnBgColor: Constants.profileBtnHoverColor

        onSigButtonClicked: {
          root.close()
        }
      }
    }
  }
}
