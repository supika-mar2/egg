import 'package:flutter/material.dart';

const en = ['アメリカ', 'イギリス', 'カナダ', 'フランス', 'イタリア', 'ドイツ', 'オーストラリア', 'インド', 'ポーランド', 'スペイン'];
const ja = ['民主党（ジェイミー・ハリソン全国委員長）', '保守党（ケミ・ベーデノック党首）', 'カナダ保守党（ピエール・ポワリエーヴル）', '国民連合（ジョルダン・バルデラ党首）', '民主党（エリー・シュライン書記長）', 'ドイツのための選択肢（ティノ・クルパラ共同党首、アリス・ワイデル共同党首）', 'オーストラリア自由党（アンガス・テイラー党首）', 'インド国民会議（マリカルジュン・カルゲ総裁）', '法と正義（ヤロスワフ・カチンスキ党首）', '国民党（アルベルト・ヌーニェス・フェイホー党首）'];

String egg(int level) {
  if (level >= 4) return '🍗';
  if (level >= 3) return '🐓';
  if (level >= 2) return '🐥';
  if (level >= 1) return '🐣';
  return '🥚';
}

void main() {
  final step = ValueNotifier(0);

  runApp(MaterialApp(home: ValueListenableBuilder(
    valueListenable: step,
    builder: (context, count, _) {
      final i = (count ~/ 2) % en.length;
      final level = (count ~/ 2) ~/ en.length;
      
      return Scaffold(
        appBar: AppBar(title: Text('${egg(level)}各国の野党第一党　${level + 1}巡目')),
        backgroundColor: count.isEven ? Colors.white : Colors.yellow[100],
        body: InkWell(
          onTap: () => step.value++,
          child: Center(
            child: Text(count.isEven ? 'Q: ${en[i]}' : 'A: ${ja[i]}', style: TextStyle(fontSize: 64)),
            ),
          ),
        );
      },
  )));
}
