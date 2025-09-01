import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/cupertino.dart';

/// @t 自定样式
/// @d 通过[AntdIconStyle]自定义样式
/// @l [AntdIcon]
class AntdIconStyleDemo extends StatelessWidget {
  const AntdIconStyleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return DemoWrapper(child: [
      AntdIcon(
        icon: AntdIcons.aa,
        style: AntdIconStyle(size: 32, color: token.colorPrimary),
      ),
      AntdIcon(
        icon: AntdIcons.aa,
        style: AntdIconStyle(size: 32, color: token.colorWarning),
      ),
      AntdIcon(
        icon: AntdIcons.aa,
        style: AntdIconStyle(size: 32, color: token.colorSuccess),
      ),
    ]);
  }
}

/// @t 线框风格
/// @d 线框风格的按钮
/// @l [AntdIcon]
class AntdIconOutlineDemo extends StatelessWidget {
  const AntdIconOutlineDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdIcon(
        icon: AntdIcons.aa,
      ),
      AntdIcon(
        icon: AntdIcons.addCircle,
      ),
      AntdIcon(
        icon: AntdIcons.add,
      ),
      AntdIcon(
        icon: AntdIcons.addSquare,
      ),
      AntdIcon(
        icon: AntdIcons.ant,
      ),
      AntdIcon(
        icon: AntdIcons.app,
      ),
      AntdIcon(
        icon: AntdIcons.appstore,
      ),
      AntdIcon(
        icon: AntdIcons.arrowDownCircle,
      ),
      AntdIcon(
        icon: AntdIcons.arrowsAlt,
      ),
      AntdIcon(
        icon: AntdIcons.audioMuted,
      ),
      AntdIcon(
        icon: AntdIcons.audio,
      ),
      AntdIcon(
        icon: AntdIcons.bankcard,
      ),
      AntdIcon(
        icon: AntdIcons.bellMute,
      ),
      AntdIcon(
        icon: AntdIcons.bell,
      ),
      AntdIcon(
        icon: AntdIcons.bill,
      ),
      AntdIcon(
        icon: AntdIcons.calculator,
      ),
      AntdIcon(
        icon: AntdIcons.calendar,
      ),
      AntdIcon(
        icon: AntdIcons.camera,
      ),
      AntdIcon(
        icon: AntdIcons.chatAdd,
      ),
      AntdIcon(
        icon: AntdIcons.chatCheck,
      ),
      AntdIcon(
        icon: AntdIcons.chatWrong,
      ),
      AntdIcon(
        icon: AntdIcons.checkCircle,
      ),
      AntdIcon(
        icon: AntdIcons.check,
      ),
      AntdIcon(
        icon: AntdIcons.checkShield,
      ),
      AntdIcon(
        icon: AntdIcons.clockCircle,
      ),
      AntdIcon(
        icon: AntdIcons.closeCircle,
      ),
      AntdIcon(
        icon: AntdIcons.close,
      ),
      AntdIcon(
        icon: AntdIcons.closeShield,
      ),
      AntdIcon(
        icon: AntdIcons.collectMoney,
      ),
      AntdIcon(
        icon: AntdIcons.compass,
      ),
      AntdIcon(
        icon: AntdIcons.content,
      ),
      AntdIcon(
        icon: AntdIcons.coupon,
      ),
      AntdIcon(
        icon: AntdIcons.delete,
      ),
      AntdIcon(
        icon: AntdIcons.downCircle,
      ),
      AntdIcon(
        icon: AntdIcons.down,
      ),
      AntdIcon(
        icon: AntdIcons.downland,
      ),
      AntdIcon(
        icon: AntdIcons.editS,
      ),
      AntdIcon(
        icon: AntdIcons.environment,
      ),
      AntdIcon(
        icon: AntdIcons.exclamationCircle,
      ),
      AntdIcon(
        icon: AntdIcons.exclamation,
      ),
      AntdIcon(
        icon: AntdIcons.exclamationShield,
      ),
      AntdIcon(
        icon: AntdIcons.exclamationTriangle,
      ),
      AntdIcon(
        icon: AntdIcons.eyeInvisible,
      ),
      AntdIcon(
        icon: AntdIcons.eye,
      ),
      AntdIcon(
        icon: AntdIcons.faceRecognition,
      ),
      AntdIcon(
        icon: AntdIcons.file,
      ),
      AntdIcon(
        icon: AntdIcons.fileWrong,
      ),
      AntdIcon(
        icon: AntdIcons.filter,
      ),
      AntdIcon(
        icon: AntdIcons.flag,
      ),
      AntdIcon(
        icon: AntdIcons.folder,
      ),
      AntdIcon(
        icon: AntdIcons.frown,
      ),
      AntdIcon(
        icon: AntdIcons.gift,
      ),
      AntdIcon(
        icon: AntdIcons.global,
      ),
      AntdIcon(
        icon: AntdIcons.handPayCircle,
      ),
      AntdIcon(
        icon: AntdIcons.heart,
      ),
      AntdIcon(
        icon: AntdIcons.histogram,
      ),
      AntdIcon(
        icon: AntdIcons.informationCircle,
      ),
      AntdIcon(
        icon: AntdIcons.key,
      ),
      AntdIcon(
        icon: AntdIcons.koubei,
      ),
      AntdIcon(
        icon: AntdIcons.left,
      ),
      AntdIcon(
        icon: AntdIcons.like,
      ),
      AntdIcon(
        icon: AntdIcons.link,
      ),
      AntdIcon(
        icon: AntdIcons.location,
      ),
      AntdIcon(
        icon: AntdIcons.lock,
      ),
      AntdIcon(
        icon: AntdIcons.loop,
      ),
      AntdIcon(
        icon: AntdIcons.mailOpen,
      ),
      AntdIcon(
        icon: AntdIcons.mail,
      ),
      AntdIcon(
        icon: AntdIcons.message,
      ),
      AntdIcon(
        icon: AntdIcons.minusCircle,
      ),
      AntdIcon(
        icon: AntdIcons.minus,
      ),
      AntdIcon(
        icon: AntdIcons.more,
      ),
      AntdIcon(
        icon: AntdIcons.movie,
      ),
      AntdIcon(
        icon: AntdIcons.payCircle,
      ),
      AntdIcon(
        icon: AntdIcons.phonebook,
      ),
      AntdIcon(
        icon: AntdIcons.picture,
      ),
      AntdIcon(
        icon: AntdIcons.pictureWrong,
      ),
      AntdIcon(
        icon: AntdIcons.pictures,
      ),
      AntdIcon(
        icon: AntdIcons.pie,
      ),
      AntdIcon(
        icon: AntdIcons.play,
      ),
      AntdIcon(
        icon: AntdIcons.questionCircle,
      ),
      AntdIcon(
        icon: AntdIcons.receipt,
      ),
      AntdIcon(
        icon: AntdIcons.receivePayment,
      ),
      AntdIcon(
        icon: AntdIcons.redo,
      ),
      AntdIcon(
        icon: AntdIcons.rightright,
      ),
      AntdIcon(
        icon: AntdIcons.scanCode,
      ),
      AntdIcon(
        icon: AntdIcons.scanningFace,
      ),
      AntdIcon(
        icon: AntdIcons.scanning,
      ),
      AntdIcon(
        icon: AntdIcons.search,
      ),
      AntdIcon(
        icon: AntdIcons.send,
      ),
      AntdIcon(
        icon: AntdIcons.set,
      ),
      AntdIcon(
        icon: AntdIcons.shopbag,
      ),
      AntdIcon(
        icon: AntdIcons.shrink,
      ),
      AntdIcon(
        icon: AntdIcons.smile,
      ),
      AntdIcon(
        icon: AntdIcons.soundMute,
      ),
      AntdIcon(
        icon: AntdIcons.sound,
      ),
      AntdIcon(
        icon: AntdIcons.star,
      ),
      AntdIcon(
        icon: AntdIcons.stop,
      ),
      AntdIcon(
        icon: AntdIcons.systemQRcode,
      ),
      AntdIcon(
        icon: AntdIcons.tag,
      ),
      AntdIcon(
        icon: AntdIcons.team,
      ),
      AntdIcon(
        icon: AntdIcons.textDeletion,
      ),
      AntdIcon(
        icon: AntdIcons.text,
      ),
      AntdIcon(
        icon: AntdIcons.transportQRcode,
      ),
      AntdIcon(
        icon: AntdIcons.travel,
      ),
      AntdIcon(
        icon: AntdIcons.truck,
      ),
      AntdIcon(
        icon: AntdIcons.undo,
      ),
      AntdIcon(
        icon: AntdIcons.unlock,
      ),
      AntdIcon(
        icon: AntdIcons.unorderedList,
      ),
      AntdIcon(
        icon: AntdIcons.upCircle,
      ),
      AntdIcon(
        icon: AntdIcons.up,
      ),
      AntdIcon(
        icon: AntdIcons.upload,
      ),
      AntdIcon(
        icon: AntdIcons.userAdd,
      ),
      AntdIcon(
        icon: AntdIcons.userCircle,
      ),
      AntdIcon(
        icon: AntdIcons.userContact,
      ),
      AntdIcon(
        icon: AntdIcons.user,
      ),
      AntdIcon(
        icon: AntdIcons.userSet,
      ),
      AntdIcon(
        icon: AntdIcons.video,
      ),
    ]);
  }
}

/// @t 实底风格
/// @d 实底风格的按钮
/// @l [AntdIcon]
class AntdIconFillDemo extends StatelessWidget {
  const AntdIconFillDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdIcon(
        icon: AntdIcons.addressBookFill,
      ),
      AntdIcon(
        icon: AntdIcons.alipayCircleFill,
      ),
      AntdIcon(
        icon: AntdIcons.alipaySquareFill,
      ),
      AntdIcon(
        icon: AntdIcons.audioFill,
      ),
      AntdIcon(
        icon: AntdIcons.checkCircleFill,
      ),
      AntdIcon(
        icon: AntdIcons.checkShieldFill,
      ),
      AntdIcon(
        icon: AntdIcons.clockCircleFill,
      ),
      AntdIcon(
        icon: AntdIcons.closeCircleFill,
      ),
      AntdIcon(
        icon: AntdIcons.downFill,
      ),
      AntdIcon(
        icon: AntdIcons.editFill,
      ),
      AntdIcon(
        icon: AntdIcons.editSFill,
      ),
      AntdIcon(
        icon: AntdIcons.exclamationCircleFill,
      ),
      AntdIcon(
        icon: AntdIcons.exclamationShieldFill,
      ),
      AntdIcon(
        icon: AntdIcons.eyeFill,
      ),
      AntdIcon(
        icon: AntdIcons.eyeInvisibleFill,
      ),
      AntdIcon(
        icon: AntdIcons.fireFill,
      ),
      AntdIcon(
        icon: AntdIcons.forbidFill,
      ),
      AntdIcon(
        icon: AntdIcons.frownFill,
      ),
      AntdIcon(
        icon: AntdIcons.heartFill,
      ),
      AntdIcon(
        icon: AntdIcons.informationCircleFill,
      ),
      AntdIcon(
        icon: AntdIcons.koubeiFill,
      ),
      AntdIcon(
        icon: AntdIcons.locationFill,
      ),
      AntdIcon(
        icon: AntdIcons.lockFill,
      ),
      AntdIcon(
        icon: AntdIcons.mailFill,
      ),
      AntdIcon(
        icon: AntdIcons.messageFill,
      ),
      AntdIcon(
        icon: AntdIcons.phoneFill,
      ),
      AntdIcon(
        icon: AntdIcons.phonebookFill,
      ),
      AntdIcon(
        icon: AntdIcons.questionCircleFill,
      ),
      AntdIcon(
        icon: AntdIcons.smileFill,
      ),
      AntdIcon(
        icon: AntdIcons.soundMuteFill,
      ),
      AntdIcon(
        icon: AntdIcons.starFill,
      ),
      AntdIcon(
        icon: AntdIcons.teamFill,
      ),
    ]);
  }
}
