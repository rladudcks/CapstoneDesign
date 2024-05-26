import 'package:flutter/material.dart';
import 'package:tennis_jamiss/models/example_candidate_model.dart';

class ExampleCard extends StatelessWidget {
  final ExampleCandidateModel candidate;

  const ExampleCard(
    this.candidate, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: candidate.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //모든 정보들 하나씩 추가해야함
                Text(
                  candidate.courtName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '경기 유형 | ' + (candidate.isSingles ? '단식' : '복식'),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(fvheight: 5),
                Text(
                  'NTRP | ' + candidate.ntrp,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
