import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:tennis_jamiss/components/exmple_card.dart';
import 'package:tennis_jamiss/models/example_candidate_model.dart';
import 'package:tennis_jamiss/screens/match/match_Info.dart';

class TennisMatchScreen extends StatefulWidget {
  const TennisMatchScreen({
    super.key,
  });

  @override
  _TennisMatchScreenState createState() => _TennisMatchScreenState();
}

class _TennisMatchScreenState extends State<TennisMatchScreen> {
  final CardSwiperController controller = CardSwiperController();

  //내가 직접 정의한 cards들 할당
  final cards = candidates.map(ExampleCard.new).toList();

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('앱바 영역'),
  //       actions: [
  //         IconButton(
  //           icon: Icon(Icons.menu_open_sharp),
  //           onPressed: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(builder: (context) => MatchInfo()),
  //             );
  //           },
  //         ),
  //       ],
  //     ),
  //     body: Flexible(
  //       child: CardSwiper(
  //           //카드 개수
  //           cardsCount: cards.length,
  //           //Widget builder for rendering cards
  //           cardBuilder:
  //               (context, index, percentThresholdX, percentThresholdY) =>
  //                   cards[index],
  //           //Card swipe callback
  //           //함수가 false 리턴 -> swipe action 취소됨
  //           //함수가 true 리턴 -> swipe action 을 예정대로 수행
  //           // onSwipe:
  //           // // (index, direction) {
  //           // //   print('Card swiped: $index $direction');
  //           // // },
  //           padding: EdgeInsets.symmetric(horizontal: 30, vertical: 100)),
  //           scale: 0.8,
  //     ),
  //   );
  // }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('테니스 재미쓰'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu_open_sharp),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MatchInfo()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: CardSwiper(
                controller: controller,
                cardsCount: cards.length,
                onSwipe: _onSwipe, //스와이프시 호출되는 콜백함수 (하단에 직접 `커마 해야함)
                onUndo: _onUndo, //실행 취소 시 호출되는 콜백함수 (하단에 직접 커마 해야함)
                numberOfCardsDisplayed: 3,
                backCardOffset: const Offset(
                    25, 0), // 뒷면 카드의 위치를 앞면 카드에서 얼마나 떨어뜨려 표시할지 결정하는 값입니다.

                padding: const EdgeInsets.symmetric(
                  //카드 위젯 패딩
                  horizontal: 20,
                  vertical: 40,
                ),
                scale:
                    0.9, //뒷면 카드의 크기를 앞면 카드에 비해 얼마나 작게 할지 결정하는 비율입니다. 기본값은 0.9입니다.
                threshold: 30, //얼만큼 밀어야 스와이프 되는지 = 낮을수록 좀만 밀어도 넘어감
                // duration: Duration(milliseconds: 50000), //카드 스와이프 애니메이션의 지속 시간입니다.
                maxAngle: 30, //카드 스와이프 시 최대로 기울어지는 각도입니다. 기본값은 30도입니다
                allowedSwipeDirection: const AllowedSwipeDirection
                    .all(), //카드 스와이프를 허용할 방향을 결정하는 값입니다. 기본값은 모든 방향을 허용하는 all입니다.
                //일단 left, bottom 은 no & right, top은 yes로 가정
                isLoop: true, //카드 스와이프를 무한 반복할지 여부입니다. 기본값은 true입니다.

                cardBuilder: (
                  //카드 모양을 정의하는 함수
                  context,
                  index,
                  horizontalThresholdPercentage,
                  verticalThresholdPercentage,
                ) =>
                    cards[index],
              ),
            ),
            // Padding( //카드 하단 스와이프 플로팅 버튼들
            //   padding: const EdgeInsets.all(0.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       FloatingActionButton(
            //         onPressed: controller.undo,
            //         child: const Icon(Icons.rotate_left),
            //       ),
            //       FloatingActionButton(
            //         onPressed: () => controller.swipe(CardSwiperDirection.left),
            //         child: const Icon(Icons.keyboard_arrow_left),
            //       ),
            //       FloatingActionButton(
            //         onPressed: () =>
            //             controller.swipe(CardSwiperDirection.right),
            //         child: const Icon(Icons.keyboard_arrow_right),
            //       ),
            //       FloatingActionButton(
            //         onPressed: () => controller.swipe(CardSwiperDirection.top),
            //         child: const Icon(Icons.keyboard_arrow_up),
            //       ),
            //       FloatingActionButton(
            //         onPressed: () =>
            //             controller.swipe(CardSwiperDirection.bottom),
            //         child: const Icon(Icons.keyboard_arrow_down),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}
