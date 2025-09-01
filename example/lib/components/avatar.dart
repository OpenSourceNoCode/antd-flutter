import 'package:antd_flutter_mobile/index.dart';
import 'package:example/widget/demo.dart';
import 'package:flutter/material.dart';

const demoAvatarImages = [
  'https://images.unsplash.com/photo-1548532928-b34e3be62fc6?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
  'https://images.unsplash.com/photo-1493666438817-866a91353ca9?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=b616b2c5b373a80ffc9636ba24f7a4a9',
  'https://images.unsplash.com/photo-1542624937-8d1e9f53c1b9?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
  'https://images.unsplash.com/photo-1546967191-fdfb13ed6b1e?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
];

/// @t 基础用法
/// @l [AntdAvatar]
class AntdAvatarDemo extends StatelessWidget {
  const AntdAvatarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdAvatar(
        image: AntdResource(url: demoAvatarImages[0]),
      ),
      AntdAvatar(
        image: AntdResource(url: demoAvatarImages[1]),
      ),
      AntdAvatar(
        image: AntdResource(url: demoAvatarImages[2]),
      ),
      AntdAvatar(
        image: AntdResource(url: demoAvatarImages[3]),
      ),
    ]);
  }
}

/// @t 占位头像
/// @d 如果你不传图片，或者图片加载失败，那么会显示一个默认的图像
/// @l [AntdAvatar]
class AntdAvatarPlaceholderDemo extends StatelessWidget {
  const AntdAvatarPlaceholderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoWrapper(child: [
      AntdAvatar(
        image: AntdResource(url: ""),
      ),
    ]);
  }
}

/// @t 不同大小
/// @l [AntdAvatar]
class AntdAvatarSizeDemo extends StatelessWidget {
  const AntdAvatarSizeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWrapper(child: [
      AntdAvatar(
        image: AntdResource(url: demoAvatarImages[0]),
        size: 32,
      ),
      AntdAvatar(
        image: AntdResource(url: demoAvatarImages[1]),
        size: 48,
      ),
      AntdAvatar(
        image: AntdResource(url: demoAvatarImages[2]),
        size: 64,
      ),
    ]);
  }
}
