import 'package:chat_app/view/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader(
      {required this.name,
      required this.description,
      required this.failure,
      required this.loading,
      super.key});

  final String name;
  final String description;
  final bool failure;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      color:
          failure ? Colors.red.withOpacity(0.9) : Colors.green.withOpacity(0.9),
      padding: EdgeInsets.symmetric(horizontal: 0.02.sw, vertical: 0.04.sw),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            loading
                ? CustomShimmer(
                    height: 0.03.sw,
                    width: 0.4.sw,
                  )
                : RichText(
                    text: TextSpan(children: [
                       WidgetSpan(
                        child: Visibility(
                          visible: failure,
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0.01.sw),
                              child: const Icon(
                                Icons.error_outline_sharp,
                                color: Colors.white,
                                size: 28,
                              )),
                        ),
                      ),
                      TextSpan(
                        text: name,
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ]),
                    softWrap: true,
                  ),
            const SizedBox(height: 8),
            loading
                ? CustomShimmer(
                    height: 0.03.sw,
                    width: 0.8.sw,
                  )
                : Text(
                    description,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    softWrap: true,
                  ),
          ],
        ),
      ),
    );
  }
}
